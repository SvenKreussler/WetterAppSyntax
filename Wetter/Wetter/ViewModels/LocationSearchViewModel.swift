//
//  LocationSearchViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 29.11.23.
//

//import Foundation
//
//@MainActor
//class LocationSearchViewModel: ObservableObject {
//    
//    init() {
//        fetchData()
//    }
//    
//    //MARK: - Variables
//    
//    @Published var locations = [Location]()
//    
//    //MARK: - Functions
//    
//    func fetchData() {
//        Task {
//            do {
//                self.locations = try await fetchLocation()
//            } catch {
//                print("Request Failed with error: \(error)")
//            }
//        }
//    }
//    
//    private func fetchLocation() async throws -> [Location] {
//        
//        guard let url = URL(string:"http://api.openweathermap.org/geo/1.0/direct?q=Berlin&limit=1&appid=29ab9d965c5e4da691c9d5979ff10190") else {
//            throw HTTPError.invalidURL
//        }
//        
//        let (data, _) = try await URLSession.shared.data(from: url)
//        
//        let result = try JSONDecoder().decode(LocationResult.self, from: data)
//        return result.results
//    }
//}
