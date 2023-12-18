//
//  LocationSearchViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 29.11.23.


// https://stackoverflow.com/questions/58012540/ios-swiftui-searchbar-and-rest-api

import Foundation

@MainActor
class LocationSearchViewModel: ObservableObject, Identifiable {
    
    init() {
        fetchData()
    }
    
    // MARK: - Variables
    
    @Published var locations = [LocationList]()
    
    // MARK: - Functions
    
    func fetchData() {
        Task {
            do {
                self.locations = try await WeatherRepository.fetchLocationData(for: "Berlin")
                // rausfinden, welche Strukturen gebraucht werden und was für Daten die Strukturen haben müssen.
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
    
}
