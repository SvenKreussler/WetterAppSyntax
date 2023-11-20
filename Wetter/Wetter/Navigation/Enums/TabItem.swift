//
//  TabItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//

import Foundation

enum TabItem {
    
    case home , maps, search
    
    var title: String {
        switch self {
        case .maps:
            return "Karten"
        case .search:
            return "Suche"
        case .home: 
            return "Start"
        }
    }
    
    var icon: String {
        switch self {
        case .maps:
            return "map"
        case .search:
            return "magnifyingglass"
        case .home:
            return "house"

        }
    }
    
}
