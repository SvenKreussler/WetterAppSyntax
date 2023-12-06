//
//  LocationFeatures.swift
//  Wetter
//
//  Created by Sven Kreußler on 01.12.23.
//

import Foundation

struct LocationFeatures: Codable {
    
    //let results: Response
    // var id = UUID()
    let lat: Float
    let current: Current

}

//struct Response: Codable, Identifiable {
//    
//    var id = UUID()
//    
//    let hourly: [Hourly]
//    let daily: [Daily]
//    let alerts: Alerts
//}

struct Current: Codable {
    
    
    let dt: Int
    let temp: Float
    let feels_like: Float
    
}

struct Hourly: Codable {
    
    let dt: Int
    let temp: Float
    
}

struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let uvi: Float
}

struct Temp: Codable {
    // Avarage of Day
    let day: Float
    let min: Float
    let max: Float
    
}

struct Alerts: Codable {
    let sender_name: String
    let event: String
    let start: Int
    let end: Int
    let description: String
}
