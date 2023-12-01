//
//  LocationSearch.swift
//  Wetter
//
//  Created by Sven Kreußler on 28.11.23.
//

import Foundation

struct LocationSearchResult: Codable {
    let results: [LocationSearch]
}

struct LocationSearch: Identifiable, Codable {
    var id = UUID()
    var name: String
    var lat: Double
    var lon: Double
}
