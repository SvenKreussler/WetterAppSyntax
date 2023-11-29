//
//  Location.swift
//  Wetter
//
//  Created by Sven Kreußler on 28.11.23.
//

import Foundation

struct LocationSearch: Identifiable {
    var id: UUID
    var name: String
    var lat: Double
    var lon: Double
}

//struct APIKeys {
//    static var weatherAPIKey = "29ab9d965c5e4da691c9d5979ff10190"
//}
//
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
