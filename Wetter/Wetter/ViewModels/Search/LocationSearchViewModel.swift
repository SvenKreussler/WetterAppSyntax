//
//  LocationSearchViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 29.11.23.


// https://stackoverflow.com/questions/58012540/ios-swiftui-searchbar-and-rest-api

import Foundation

class LocationSearchViewModel: ObservableObject {
    
    init(location: Location) {
        self.location = location
        self.id = location.id ?? UUID()
        self.city = location.city ?? ""
        self.lat = location.lat
        self.lon = location.lon
        
    }
    
    private let container = PersistentStore.shared
    
    // MARK: - Variables
    
    @Published var locations = [LocationList]()
    
    
    // MARK: - Functions
    
    // MARK: - Variables
    let location: Location
    let id: UUID
    let city: String
    let lat: Double
    let lon: Double
    
    func delete() {
        container.context.delete(location)
        container.save()
    }
}

