//
//  OnboardingItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 08.01.24.
//

import SwiftUI

enum OnboardingItem: String, Identifiable, CaseIterable {
    case homeFrist, homeSecound, locationSelectFirst, locationSelectSecound, locationSelectThird,
        locationSelectFourth
    
    var id: String { rawValue }
    
    var screen: String {
        switch self {
        case .homeFrist:
            return "1"
        case .homeSecound:
            return "2"
        case .locationSelectFirst:
            return "3"
        case .locationSelectSecound:
            return "4"
        case .locationSelectThird:
            return "5"
        case .locationSelectFourth:
            return "6"
        }
    }
    
    var title: String {
        switch self {
        case .homeFrist:
            return "Erste Ansicht"
        case .homeSecound:
            return "Auswahl Tageszusammenfassung"
        case .locationSelectFirst:
            return "Ausgewählte Ortschaften"
        case .locationSelectSecound:
            return "Ortschaft hinzufügen"
        case .locationSelectThird:
            return "Ortschaft speichern"
        case .locationSelectFourth:
            return "Ortschaft hinzugefügt"
        }
    }
    
    var describtion: String {
        switch self {
        case .homeFrist:
            return "Die erste Ansicht Übersicht vom Wetter"
        case .homeSecound:
            return "Temperaturübersicht wird angezeigt"
        case .locationSelectFirst:
            return "Wählen Sie die Ortschaft aus, von der sie das Wetter haben möchten"
        case .locationSelectSecound:
            return "Fügen Sie eine Ortschaft hinzu"
        case .locationSelectThird:
            return "die Ortschaft wird nun gepeichert"
        case .locationSelectFourth:
            return "die Ortschaft wird angezeigt"
        }
    }
}
