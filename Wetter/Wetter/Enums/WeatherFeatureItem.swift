//
//  WeatherFeatureItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 27.11.23.
//
//  abstract: Enum for selecting WeatherFeature in weather sheet

import Foundation

enum WeatherFeatureItem: String, CaseIterable {
    
    
    
    case rainChance, feelsLike, uvIndex
    
//    var title: String {
//        switch self {
//        case .rainChance:
//            return "100"
//             
//        case .feelsLike:
//            return "23"
//        case .uvIndex:
//            return "0,1"
//        }
//    }
    
    var icon: String {
        switch self {
        case .rainChance:
            return "cloud.rain"
            
        case .feelsLike:
            return "thermometer.variable.and.figure"
        case .uvIndex:
            return "sun.max"
        }
    }
}
