//
//  WetterApp.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//

import SwiftUI

@main
struct WetterApp: App {
     
    
    
    var body: some Scene {
        WindowGroup {
            TabsView()
                .opacity(onboarding ? 1 : 0)
                .overlay {
                    if !onboarding {
                        OnboardingView()
                    }
                }
                 
        }
    }
    
    // MARK: - Varibales
    
    @AppStorage("onboarding") private var onboarding = false
}
