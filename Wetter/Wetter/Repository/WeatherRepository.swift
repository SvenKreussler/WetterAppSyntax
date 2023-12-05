//
//  WeatherRepository.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.12.23.
//

import Foundation

class WeatherRepository {
    
    private static var weatherAPIKey = "29ab9d965c5e4da691c9d5979ff10190"
    
    private static var locationList = ""
    
    static func fetchWeather() async throws -> LocationFeatures {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=52,44&lon=13,40&units=metric&exclude=minutely&lang=de&appid=29ab9d965c5e4da691c9d5979ff10190") else {
            throw HTTPError.invalidURL
        }
        let (data, _) =  try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(LocationFeatures.self, from: data)
    }
}
