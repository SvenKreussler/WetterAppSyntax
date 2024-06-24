//
//  APIKey.swift
//  Wetter
//
//  Created by Sven Kreußler on 13.02.24.
//

import Foundation

enum APIKey {
    case openWeatherMap
    
    var key: String {
        switch self {
        case .openWeatherMap:
            return "f7c82b2722b1f60d28e2792f7e4438ec"
        }
    }
}
