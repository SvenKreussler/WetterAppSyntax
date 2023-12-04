//
//  LocationFeaturesViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 04.12.23.
//

import Foundation

@MainActor

class LocationFeaturesViewModel: ObservableObject {
    
    // MARK: - Init
    init() {
        fetchData()
    }
    
    // MARK: - Variables
    
    @Published var weatherfeatures = [Current]()
    
    // MARK: - Functions
    
    func fetchData() {
        Task {
            do {
                self.weatherfeatures = try await fetchFeatures()
                
                
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
    private func fetchFeatures() async throws -> [Current] {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=52,44&lon=13,40&units=metric&exclude=minutely&lang=de&appid=29ab9d965c5e4da691c9d5979ff10190") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(LocationFeatures.self, from: data)
        return result.current
    }
    
}
