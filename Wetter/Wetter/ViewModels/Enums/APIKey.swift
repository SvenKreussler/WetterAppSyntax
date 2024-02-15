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
            return "940e6006cf45840b3a4c4d1ab5115cc8"
        }
    }
}
