//
//  MergedData.swift
//  Wetter
//
//  Created by Sven Kreußler on 28.02.24.
//
//  abstract: model for the merged API-Call and CoreData

import Foundation
struct MergedLocationData {
    let city: String
    let lat: Float
    let lon: Float
    let weatherFeature: LocationFeatures
}
