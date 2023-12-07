//
//  LocationFeaturesViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 04.12.23.
//

import Foundation

@MainActor

class LocationFeaturesViewModel: ObservableObject, Identifiable {
    
    
    /// Berlin,München, Hamburg
    
    
    private static var locationList =
        [LocationList(lat: 52.5170365, lon: 13.3888599)
        //LocationList(lat: 48.1371079, lon: 11.5753822),
        //LocationList(lat: 53.550341, lon: 10.000654)]
        ]
    
    init() {
        fetchData()
    }
    
    
    
    // MARK: - Variables
    
    @Published var weatherfeatures: [LocationFeatures] = []
    @Published var hourlyData: [Hourly] = []
    
    
    // MARK: - Functions
    
    
    func fetchData() {
        Task {
            do {
//                self.weatherfeatures = try await WeatherRepository.fetchWeather(for: LocationFeaturesViewModel.locationList)
//                self.hourlyData = try await WeatherRepository.fetchWeather(for: LocationFeaturesViewModel.locationList)
                let locationFeatures = try await WeatherRepository.fetchWeather(for: LocationFeaturesViewModel.locationList, responseType: LocationFeatures.self) 
                let hourlyData = try await WeatherRepository.fetchWeather(for: LocationFeaturesViewModel.locationList, responseType: Hourly.self)
                print(locationFeatures)
                print(hourlyData)
                
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
}
