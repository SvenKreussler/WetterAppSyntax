//
//  LocationFeaturesViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 04.12.23.
//

import Foundation

@MainActor

class LocationFeaturesViewModel: ObservableObject {
    
    
    init() {
        fetchData()
    }
    
    // MARK: - Variables
    
    @Published var weatherfeatures = LocationFeatures(current: Current(dt: 0, temp: 0, feels_like: 0.00))
    
    // MARK: - Functions
    
    func fetchData() {
        Task {
            do {
                self.weatherfeatures = try await WeatherRepository.fetchWeather()
                
                
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
}
