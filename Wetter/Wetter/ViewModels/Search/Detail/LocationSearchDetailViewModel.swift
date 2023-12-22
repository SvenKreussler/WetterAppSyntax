//
//  LocationDetailViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import Foundation

class LocationSearchDetailViewModel: ObservableObject {
    
    
    // MARK: - Variables
    
    private let container = PersistentStore.shared
    
    @Published var city = ""
    
    // MARK: - Computed Properties
    
    var disableSaving: Bool {
        city.isEmpty
    }
    
    // MARK: - Functions
    
    func save() {
        let location = Location(context: container.context)
        location.id = UUID()
        location.city = city
        
        container.save()
        
    }
    
}


