//
//  APIKeys.swift
//  Wetter
//
//  Created by Sven Kreußler on 13.02.24.
//

import Foundation

enum APIKey {
    case weatherAPIKey
    
    var key: String {
        switch self {
        case .weatherAPIKey:
            return "2ffe342e07c2e0410849366078cae289"
        }
    }
}
