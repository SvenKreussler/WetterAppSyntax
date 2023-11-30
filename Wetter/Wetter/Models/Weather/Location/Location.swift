//
//  Location.swift
//  Wetter
//
//  Created by Sven Kreußler on 28.11.23.
//

import Foundation

struct LocationSearch: Identifiable {
    var id = UUID()
    var name: String
    var lat: Double
    var lon: Double
}
