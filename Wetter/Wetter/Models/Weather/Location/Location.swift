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

//struct LocationResult: Codable {
//    let results: [Location]
//}
//
//struct Location: Codable {
//    
//    var name: String
//    var lat: Double
//    var lon: Double
//    var country: String
//}


//struct RequestName: Codable {
//    var name: String
//}
//struct Response: Codable {
//    var main: Location
//}
//
//struct Location: Codable {
//    var lat: Double
//    var lon: Double
//}
