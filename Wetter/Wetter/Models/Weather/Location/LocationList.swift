//
//  LocationList.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.12.23.
//
//  abstract: model for the location request 

import Foundation

struct LocationList: Codable, Identifiable {
    
    var city: String
    
    var lat: Float
    var lon: Float
    var id = UUID()
    
    init(city: String = "", lat: Float = 0.0, lon: Float = 0.0) {
            self.city = city
            self.lat = lat
            self.lon = lon
        }
}
