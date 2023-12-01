//
//  LocationFeatures.swift
//  Wetter
//
//  Created by Sven Kreußler on 01.12.23.
//

import Foundation

struct LocationFeatures: Codable {
    
    var result: [Response]
}

struct Response: Codable {
    
    let current: Current
    let hourly: Hourly
    let daily: Daily
}

struct Current: Codable {
    
    let dt: Int
    let temp: Double
    let feels_like: Double
    
}

struct Hourly: Codable {
    
    let dt: Int
    let temp: Double
    
}

struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let uvi: Double
}

struct Temp: Codable {
    // Avarage of Day
    let day: Double
    let min: Double
    let max: Double
    
}
