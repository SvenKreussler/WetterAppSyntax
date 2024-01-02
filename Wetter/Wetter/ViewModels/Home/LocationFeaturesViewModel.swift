//
//  LocationFeaturesViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 04.12.23.
//

import Foundation
import CoreLocation

@MainActor

class LocationFeaturesViewModel: ObservableObject, Identifiable {
    
    private static var locationList = [LocationList(name: "--", lat: 0.00, lon: 0.00)]
    /// Berlin, helsinki, kairo
    //    [LocationList(name: "Berlin", lat: 52.5170365, lon: 13.3888599),
    //     LocationList(name: "Helsinki", lat: 60.1674881, lon: 24.9427473),
    //     LocationList(name: "Kairo", lat: 6.1327342, lon: 6.1327342)]
    

    init() {
        fetchWeatherData()
    }
    
    
    
    
    // MARK: - Variables
    
    @Published var weatherfeatures: [LocationFeatures] = [ LocationFeatures(lat: 0.0, lon: 0.0, current: LocationFeatures.Current(dt: 0, temp: 0.0, feels_like: 0.0), hourly: [LocationFeatures.Hourly(dt: 0, temp: 0.0)], daily: [LocationFeatures.Daily(dt: 0, temp: LocationFeatures.Temp.init(day: 0.00, min: 0.00, max: 0.00), uvi: 0.00)])
    ]
    
    
    
    // MARK: - Functions
    
    func fetchLocationData() {
        Task {
            do {
                LocationFeaturesViewModel.locationList = try await WeatherRepository.fetchLocationData(for: "Tokio")
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
    
    func fetchWeatherData() {
        Task {
            do {
                
                weatherfeatures = try await WeatherRepository.fetchWeather(for: LocationFeaturesViewModel.locationList, responseType: LocationFeatures.self)
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
}
