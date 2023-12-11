//
//  WetterApp.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//

import SwiftUI

@main
struct WetterApp: App {
    
    @StateObject private var locationCurrent = LocationFeaturesViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabsView()
                .environmentObject(locationCurrent)
                .onAppear(perform: {
                    locationCurrent.fetchData()
                }
                )
        }
    }
}
