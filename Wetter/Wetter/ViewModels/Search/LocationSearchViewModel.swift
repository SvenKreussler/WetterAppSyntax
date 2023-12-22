//
//  LocationSearchViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 29.11.23.




import Foundation

class LocationSearchViewModel: ObservableObject {
    
    init(location: Location) {
        self.location = location
        self.id = location.id ?? UUID()
        self.city = location.city ?? ""
        // self.lat = location.lat
        // self.lon = location.lon
        
    }
    
    private let container = PersistentStore.shared
    
    // MARK: - Variables
    
    @Published var locations = [LocationList]()
    
    
    
    
    // MARK: - Variables
    let location: Location
    let id: UUID
    let city: String
    //let lat: Double
    //let lon: Double
    
    
    // MARK: - Functions
    func delete() {
        container.context.delete(location)
        container.save()
    }
    
    // MARK: - Functions
    
    func save() {
        let location = Location(context: container.context)
        location.id = UUID()
        location.city = city
        //location.lat = lat
        //location.lon = lon
        
        container.save()
        
    }
}

