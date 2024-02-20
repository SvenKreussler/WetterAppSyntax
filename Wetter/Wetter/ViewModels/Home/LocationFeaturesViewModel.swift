//
//  LocationFeaturesViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 04.12.23.
//

import Foundation
import CoreData
import CoreLocation

@MainActor

class LocationFeaturesViewModel: ObservableObject, Identifiable {
    /// Berlin, helsinki, kairo
    @Published var locationList = [LocationList(city: "Berlin", lat: 52.5170365, lon: 13.3888599),
     LocationList(city: "Helsinki", lat: 60.1674881, lon: 24.9427473),
     LocationList(city: "Kairo", lat: 6.1327342, lon: 6.1327342)]
    
    
    init() {
        
        // fetchLocationData()
         fetchWeatherData()
        // fetchLocationDataLocal()
        getCityNames()
    }
    // MARK: - Variables
    
    @Published var weatherfeatures: [LocationFeatures] = [ LocationFeatures(lat: 0.0, lon: 0.0,
                                                                            current: LocationFeatures.Current(dt: 0, temp: 0.0, feels_like: 0.0),
                                                                            hourly: [LocationFeatures.Hourly(dt: 0, temp: 0.0)],
                                                                            daily: [LocationFeatures.Daily(dt: 0, temp: LocationFeatures.Temp(day: 0.00, min: 0.00, max: 0.00), uvi: 0.00)])]
    
    @Published var locations: [String] = []
    
       
    private let container = PersistentStore.shared
    
    
    // MARK: - Functions
    
    func getCityNames() {
            for (index, location) in locations.enumerated() {
                let components = location.components(separatedBy: ",")
                guard components.count == 2,
                      let latitude = Double(components[0]),
                      let longitude = Double(components[1]) else {
                    continue
                }

                reverseGeocodeLocation(latitude: latitude, longitude: longitude) { result in
                    DispatchQueue.main.async {
                        self.locations[index] = "\(latitude), \(longitude), \(result)"
                    }
                }
            }
        }
    
    func fetchLocationData() {
        // Startet ein API Call, um den Städtenamen in Längen und Breitengrad aufzulösen
        
        Task {
            do {
                self.weatherfeatures = try await WeatherRepository.fetchWeather(for: locationList, responseType: LocationFeatures.self)
                
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
    func resolveCoordinatesToName() {
        
        Task {
            do {
                print("Nix")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func fetchWeatherData() {
        Task {
            do {
                
                weatherfeatures = try await WeatherRepository.fetchWeather(for: locationList, responseType: LocationFeatures.self)
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
}
