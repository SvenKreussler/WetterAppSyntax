//
//  LocationWithCity.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.01.24.
//

import Foundation

struct LocationWithCity: Codable {
    
    let city: String
    let lat: Float
    let lon: Float
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
    
    
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
    
    static func withCity(_ locationFeatures: LocationFeatures, _ locationWithCity: LocationWithCity) -> LocationWithCity {
            return LocationWithCity(
                city: locationWithCity.city,
                lat: locationWithCity.lat,
                lon: locationWithCity.lon,
                current: locationWithCity.current,
                hourly: locationWithCity.hourly,
                daily: locationWithCity.daily
            )
        }
    
    
}
