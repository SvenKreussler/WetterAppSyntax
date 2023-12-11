//
//  LocationSearchViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 29.11.23.


// https://stackoverflow.com/questions/58012540/ios-swiftui-searchbar-and-rest-api

import Foundation

@MainActor
class LocationSearchViewModel: ObservableObject {
    
    init() {
        fetchData()
    }
    
    // MARK: - Variables
    
    @Published var locations = [LocationSearch]()
    
    // MARK: - Functions
    
    func fetchData() {
        Task {
            do {
                self.locations = try await fetchLocation()
            } catch {
                print("Request Failed with error: \(error)")
            }
        }
    }
    
    private func fetchLocation() async throws -> [LocationSearch] {
        
        guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=Berlin&limit=1&appid=29ab9d965c5e4da691c9d5979ff10190") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(LocationSearchResult.self, from: data)
        return result.results
    }
}
