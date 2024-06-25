//
//  LocationModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 18.12.23.
//
//  abstract: viewmodel CoreData

import SwiftUI

class LocationViewModel: ObservableObject, Identifiable {
    
    init(location: Location) {
        self.location = location
        self.id = location.id ?? UUID()
        self.city = location.city ?? ""
        self.lat = location.lat
        self.lon = location.lon
    }
    
    private let container = PersistentStore.shared
    
    // MARK: - Variables
    let location: Location
    let id: UUID
    let city: String
    let lat: Float
    let lon: Float
    
    func delete() {
        container.context.delete(location)
        container.save()
    }
}
