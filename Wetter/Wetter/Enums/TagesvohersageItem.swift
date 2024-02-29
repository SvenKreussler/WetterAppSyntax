//
//  TagesvohersageItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//
//  abstract: Enum for tagevohersage

import Foundation

enum TagesvohersageItem: String, CaseIterable {
    
    case jetzt, vierstunden, achtstunden, zwölfstunden, sechszehnstunden, zwanzigstunden, vierundzwanzigstunden
    
    var title: String {
        switch self {
        case .jetzt:
            return "Jetzt"
        case .vierstunden:
            return "+4h"
        case .achtstunden:
            return "+8h"
        case .zwölfstunden:
            return "+12h"
        case .sechszehnstunden:
            return "+16h"
        case .zwanzigstunden:
            return "+20h"
        case .vierundzwanzigstunden:
            return "+24h"
        }
    }
    
    var degree: String {
        switch self {
        case .jetzt:
            return "23"
        case .vierstunden:
            return "20"
        case .achtstunden:
            return "18"
        case .zwölfstunden:
            return "27"
        case .sechszehnstunden:
            return "23"
        case .zwanzigstunden:
            return "13"
        case .vierundzwanzigstunden:
            return "24"
        }
    }
    
    var icon: String {
        switch self {
        case .jetzt:
            return "sun.max"
        case .vierstunden:
            return "sun.haze"
        case .achtstunden:
            return "sun.max"
        case .zwölfstunden:
            return "cloud.sun"
        case .sechszehnstunden:
            return "cloud"
        case .zwanzigstunden:
            return "sun.max"
        case .vierundzwanzigstunden:
            return "sun.haze"
        }
    }
}
