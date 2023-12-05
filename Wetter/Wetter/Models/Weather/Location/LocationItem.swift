//
//  LocationItem.swift
//  Wetter
//
//  Created by Sven Kreußler on 05.12.23.
//

import Foundation

struct LocationItems: Identifiable {
    var id = UUID()
    var locationList: [LocationFeatures]
}
