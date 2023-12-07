//
//  ReverseLocation.swift
//  Wetter
//
//  Created by Sven Kreußler on 06.12.23.
//

import CoreLocation

func reverseGeocodeLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (String?) -> Void) {
    let location = CLLocation(latitude: latitude, longitude: longitude)
    
    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
        guard let placemark = placemarks?.first, error == nil else {
            completion(nil)
            return
        }
        
        // Access the city or location information from the placemark
        if let city = placemark.locality {
            completion(city)
        } else if let name = placemark.name {
            completion(name)
        } else {
            completion(nil)
        }
    }
}

