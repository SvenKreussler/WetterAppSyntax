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
            scheduleLocationFetchTimer()
            
            Publishers.Zip($locationList, $weatherfeatures)
                        .map(mergeData)
                        .assign(to: &$mergedData)
        }
    
    // MARK: - Variables
    
    @Published var weatherfeatures: [LocationFeatures] = [LocationFeatures(lat: 0.0, lon: 0.0, current: LocationFeatures.Current(dt: 0, temp: 0.0, feels_like: 0.0), hourly: [LocationFeatures.Hourly(dt: 0, temp: 0.0)], daily: [LocationFeatures.Daily(dt: 0, temp: LocationFeatures.Temp(day: 0.00, min: 0.00, max: 0.00), uvi: 0.00)])]
    
    @Published var locationList = [LocationList()]

    @Published var locations: [String] = []
    
    private let container = PersistentStore.shared
    
    @Published var locationViewModels: [LocationViewModel] = []
    
    @Published var mergedData: [MergedLocationData] = []
    
    private var locationFetchTimer: Timer?
    private let locationFetchInterval: TimeInterval = 14400 // 4 hours in seconds
    
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
    
    
    func scheduleLocationFetchTimer() {
            // Invalidate any existing timer before creating a new one
            locationFetchTimer?.invalidate()
            
            // Create a new timer to fetch locations
            locationFetchTimer = Timer.scheduledTimer(withTimeInterval: locationFetchInterval, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.fetchLocations()
            }
        }
    
}
