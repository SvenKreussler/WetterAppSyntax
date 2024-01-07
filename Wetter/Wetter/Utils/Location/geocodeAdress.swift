//
//  geocodeAdress.swift
//  Wetter
//
//  Created by Sven Kreußler on 18.12.23.
//

import Foundation
import CoreLocation

func geocodeAddress(_ address: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
    let geocoder = CLGeocoder()
    
    geocoder.geocodeAddressString(address) { (placemarks, error) in
        if let error = error {
            completion(nil, error)
            return
        }
        
        if let location = placemarks?.first?.location?.coordinate {
            completion(location, nil)
        } else {
            completion(nil, NSError(domain: "Geocoding", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location not found"]))
        }
    }
}
