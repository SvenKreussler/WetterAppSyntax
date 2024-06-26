//
//  LocationDetailViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//
// abstract: Persistent Save Location and thier Coordinates

import Foundation
import CoreLocation

class LocationSearchDetailViewModel: ObservableObject {
    
    
    // MARK: - Variables
    
    private let container = PersistentStore.shared
    
    private let geocoder = CLGeocoder()
    
    
    static let shared = LocationSearchDetailViewModel()
    
    
    @Published var city = ""
    
    // MARK: - Computed Properties
    
    var disableSaving: Bool {
        city.isEmpty
    }
    
    // MARK: - Functions
    
    func save(cityName: String, coordinates: CLLocationCoordinate2D) {
        let location = Location(context: container.context)
        location.id = UUID()
        location.city = cityName
        location.lat = Float(coordinates.latitude)
        location.lon = Float(coordinates.longitude)
        
        
        container.save()
        
    }
    
    func coordinates(for city: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        geocoder.geocodeAddressString(city) { placemarks, error in
            if let error = error {
                print("Geocoding error:", error)
                completion(nil, error)
            } else if let placemark = placemarks?.first {
                let coordinates = placemark.location?.coordinate
                print("Coordinates for \(city): \(coordinates)")
                completion(coordinates, nil)
            } else {
                print("No placemarks found for \(city)")
                completion(nil, NSError(domain: "YourApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No coordinates found for the provided city name."]))
            }
        }
    }
    
    
    
}
