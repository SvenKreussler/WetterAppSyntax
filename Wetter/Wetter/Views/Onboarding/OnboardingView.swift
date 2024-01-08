//
//  OnboardingView.swift
//  Wetter
//
//  Created by Sven Kreußler on 08.01.24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing: 0) {
            OnbaordingHeader()
                .padding(24)
            OnboardingItemView()
        }
        
    }
}

#Preview {
    OnboardingView()
}
