//
//  WochenvohersageItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 22.11.23.
//
//  abstract: enum of Wochenvohersage



import Foundation

enum WochenvohersageItem: String, CaseIterable {
    
    
    case heute, morgen, übermorgen, dreitage, viertage,
    fünftage, sechstage
    
    var title: String {
        switch self {
        case .heute:
            return "Heute"
        case .morgen:
            return "Dienstag"
        case .übermorgen:
            return "Mittwoch"
        case .dreitage:
            return "Donnerstag"
        case .viertage:
            return "Freitag"
        case .fünftage:
            return "Samstag"
        case .sechstage:
            return "Sonntag"
        }
    }
    
    var degrees: String {
        switch self {
        case .heute:
            return "13"
        case .morgen:
            return "8"
        case .übermorgen:
            return "0"
        case .dreitage:
            return "23"
        case .viertage:
            return "13"
        case .fünftage:
            return "23"
        case .sechstage:
            return "23"
        }
    }
    
    var icon: String {
        switch self {
        case .heute:
            return "sun.min"
        case .morgen:
            return "sun.min"
        case .übermorgen:
            return "sun.haze"
        case .dreitage:
            return "cloud.sun"
        case .viertage:
            return "sun.rain"
        case .fünftage:
            return "sun.min"
        case .sechstage:
            return "sun.snow"
        }
    }
}
