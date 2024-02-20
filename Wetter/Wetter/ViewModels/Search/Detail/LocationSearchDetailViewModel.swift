//
//  LocationDetailViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import Foundation
import CoreLocation

class LocationSearchDetailViewModel: ObservableObject {
    
    
    // MARK: - Variables
    
    private let container = PersistentStore.shared
    
    private let geocoder = CLGeocoder()
    
    
    
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
        //TODO: implement lan/lat for persistent saving
        
        container.save()
        
    }
    
    func coordinates(for city: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        geocoder.geocodeAddressString(city) { placemarks, error in
            if let error = error {
                completion(nil, error)
            } else if let placemark = placemarks?.first {
                completion(placemark.location?.coordinate, nil)
            } else {
                completion(nil, NSError(domain: "YourApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No coordinates found for the provided city name."]))
            }
        }
    }
    
    
    
}
