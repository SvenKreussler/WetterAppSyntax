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
                        .scaledToFit()
                    
                    VStack(spacing: 12) {
                        Text(item.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(item.describtion)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                    }
                        
                }
                .frame(width:300, height:600 )
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal, 24)
            }
        }
        
    }
}

#Preview {
    OnboardingItemView()
}
