//
//  WeatherRepository.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.12.23.
//

import Foundation

class WeatherRepository {
    
    private static var weatherAPIKey = "29ab9d965c5e4da691c9d5979ff10190"
    
    static func fetchWeather<T: Codable>(for locations: [LocationList], responseType: T.Type) async throws -> [T] {
        
        var allWeatherData: [T] = []
        
        
        for location in locations {
            let urlString = "https://api.openweathermap.org/data/3.0/onecall?"
            
            // Prepare the location as a query string
            let locationQuery = "lat=\(location.lat.description.replacingOccurrences(of: ".", with: ","))&lon=\(location.lon.description.replacingOccurrences(of: ".", with: ","))"
            
            // Prepare the complete API URL
            let apiUrlString = "\(urlString)\(locationQuery)&units=metric&exclude=minutely&lang=de&appid=\(weatherAPIKey)"
            
            // https://api.openweathermap.org/data/3.0/onecall?lat=48.13&lon=11.57&units=metric&exclude=minutely&lang=de&appid=29ab9d965c5e4da691c9d5979ff10190
            
            guard let url = URL(string: apiUrlString) else {
                throw HTTPError.invalidURL
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            // (data, _) ´_´ ist platzhalter für respsonse: zb 200 für alles ok
            
            // let jsonString = String(data: data, encoding: .utf8)
            // print("Received JSON: \(jsonString ?? "Unable to convert to string")")
            
            let weatherData = try JSONDecoder().decode(T.self, from: data)
            allWeatherData.append(weatherData)
            
            // print(jsonString)
            
            
        }
        return allWeatherData
    }
    
    static func fetchLocationData(for city: String) async throws -> [LocationList] {
            let urlString = "https://api.openweathermap.org/geo/1.0/direct"
            let locationQuery = "q=\(city)&limit=1&appid=\(weatherAPIKey)"
            let apiUrlString = "\(urlString)?\(locationQuery)"
            
        // https://api.openweathermap.org/geo/1.0/direct?q=berlin&limit=1&appid=29ab9d965c5e4da691c9d5979ff10190

            guard let url = URL(string: apiUrlString) else {
                throw HTTPError.invalidURL
            }

            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonString = String(data: data, encoding: .utf8)
            print("Received JSON: \(jsonString ?? "Unable to convert to string")")

            let locationData = try JSONDecoder().decode([LocationList].self, from: data)
            return locationData
        }
    
    
}
// https://api.openweathermap.org/data/3.0/onecall?lat=52,44&lon=13,40&units=metric&exclude=minutely,hourly,daily&lang=de&appid=29ab9d965c5e4da691c9d5979ff10190 ok
