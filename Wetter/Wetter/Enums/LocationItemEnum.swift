//
//  LocationItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import Foundation


enum LocationItemEnum: String, CaseIterable {
    // TODO: Hier definieren ´Zeitansage´ ´Wettervorhersage´ was für Eigenschaften das Enum hat
    
    
    
    case berlin, münchen, hamburg
    
    var title: String {
        switch self {
        case .berlin:
            return "Berlin"
        case .münchen:
            return "München"
        case .hamburg:
            return "Hamburg"
        
        }
    }
    
    var icon: String {
        switch self {
        case .berlin:
            return "sun.max"
        case .münchen:
            return "sun.haze"
        case .hamburg:
            return "cloud.sun"
        }
    }
}
