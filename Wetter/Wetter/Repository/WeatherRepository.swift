//
//  WeatherRepository.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.12.23.
//
//  Abstract: Parameters for call

import Foundation

class WeatherRepository {
    
        
    private static let weatherAPIKey = APIKey.openWeatherMap.key
    
    static func fetchWeather<T: Codable>(for locations: [LocationList], responseType: T.Type) async throws -> [T] {
        var allWeatherData: [T] = []
        
        for location in locations {
            let urlString = "https://api.openweathermap.org/data/3.0/onecall?"
            
            let locationQuery = "lat=\(location.lat.description.replacingOccurrences(of: ".", with: ","))&lon=\(location.lon.description.replacingOccurrences(of: ".", with: ","))"
            
            let apiUrlString = "\(urlString)\(locationQuery)&units=metric&exclude=minutely&lang=de&appid=\(weatherAPIKey)"
            
            guard let url = URL(string: apiUrlString) else {
                throw HTTPError.invalidURL
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            // (data, _) ´_´ ist platzhalter für response: zb 200 für alles ok
            
            let jsonString = String(data: data, encoding: .utf8)
             print("Received JSON: \(jsonString ?? "Unable to convert to string")")
            
            let weatherData = try JSONDecoder().decode(T.self, from: data)
            allWeatherData.append(weatherData)
            // test
            
            
            
        }
        return allWeatherData
    }
    
}
