//
//  LocationList.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.12.23.
//

import Foundation

struct LocationList: Codable {
    
    var city: String
    
    var lat: Float
    var lon: Float
    var id = UUID()
}
