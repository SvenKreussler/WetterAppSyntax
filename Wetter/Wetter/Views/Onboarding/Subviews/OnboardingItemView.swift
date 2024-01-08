//
//  OnboardingItemView.swift
//  Wetter
//
//  Created by Sven Kreußler on 08.01.24.
//

import SwiftUI

struct OnboardingItemView: View {
    var body: some View {
        TabView {
            ForEach(OnboardingItem.allCases) { item in
                VStack {
                    Image(item.screen)
                        .resizable()
                        // .scaledToFill()
                    
                    VStack(spacing: 12) {
                        Text(item.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(item.describtion)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                    }
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal, 24)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingItemView()
}
