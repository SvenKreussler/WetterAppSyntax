//
//  OnboardingView.swift
//  Wetter
//
//  Created by Sven Kreußler on 08.01.24.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Variables
    @AppStorage("onboarding") private var onboarding = false
    
    var body: some View {
        VStack(spacing: 0) {
            OnbaordingHeader()
                .padding(24)
            OnboardingItemView()
            
            OnBoardingDissmiss(title: "Los Geht's", action: letsGo)
        }
        
    }
    
    // MARK: - Functions
    
    private func letsGo() {
        onboarding = true
    }
}

#Preview {
    OnboardingView()
}
