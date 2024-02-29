//
//  LocationFeaturesViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 04.12.23.
//
//  abstract: logic of the viewmodel

import Foundation
import CoreData
import CoreLocation
import Combine

@MainActor

class LocationFeaturesViewModel: ObservableObject, Identifiable {
    
    init() {
        fetchLocations()
        Task {
            scheduleWeatherFetchTimer()
        }
        Publishers.Zip($locationList, $weatherfeatures)
                    .map(mergeData)
                    .assign(to: &$mergedData)
        
        //The ampersand (&) in .assign(to: &$mergedData) is used to pass the reference of the mergedData property to the assign method.
        //So, in summary, the ampersand (&) allows assign to modify the mergedData property directly.
    }
    
    // MARK: - Variables
    
    @Published var weatherfeatures: [LocationFeatures] = [LocationFeatures(lat: 0.0, lon: 0.0, current: LocationFeatures.Current(dt: 0, temp: 0.0, feels_like: 0.0), hourly: [LocationFeatures.Hourly(dt: 0, temp: 0.0)], daily: [LocationFeatures.Daily(dt: 0, temp: LocationFeatures.Temp(day: 0.00, min: 0.00, max: 0.00), uvi: 0.00)])]
    
    @Published var locationList = [LocationList()]

    @Published var locations: [String] = []
    
    private let container = PersistentStore.shared
    
    @Published var locationViewModels: [LocationViewModel] = []
    
    @Published var mergedData: [MergedLocationData] = []
    
    private var weatherFetchTimer: Timer?
    private let fetchInterval: TimeInterval = 3600
    
    // MARK: - Functions
    
    func mergeData(locationList: [LocationList], weatherfeatures: [LocationFeatures]) -> [MergedLocationData] {
            zip(locationList, weatherfeatures).map { location, weatherFeature in
                MergedLocationData(city: location.city, lat: location.lat, lon: location.lon, weatherFeature: weatherFeature)
            }
        }
    
    func fetchWeatherData() async {
        do {
            weatherfeatures = try await WeatherRepository.fetchWeather(for: locationList, responseType: LocationFeatures.self)
        } catch {
            print("Request Failed with error: \(error)")
        }
    }
    
    func fetchLocations() {
        let request = NSFetchRequest<Location>(entityName: "Location")
        request.sortDescriptors = [NSSortDescriptor(key: "city", ascending: true)]
        
        do {
            let locations = try container.context.fetch(request)
            // Map LocationViewModel properties to LocationList and assign them to locationList
            self.locationList = locations.map { LocationList(city: $0.city ?? "", lat: $0.lat, lon: $0.lon) }
        } catch {
            print("error fetching: \(error)")
        }
    }
    
    func scheduleWeatherFetchTimer() -> Date? {
        // Invalidate any existing timer before creating a new one
        weatherFetchTimer?.invalidate()
        
        // Create a weak reference to self to avoid strong reference cycle
        weatherFetchTimer = Timer.scheduledTimer(withTimeInterval: fetchInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task {
                await self.fetchWeatherData()
            }
        }
        
        // Return the last scheduled time if the timer was set
        return weatherFetchTimer?.fireDate
    }
    
}
