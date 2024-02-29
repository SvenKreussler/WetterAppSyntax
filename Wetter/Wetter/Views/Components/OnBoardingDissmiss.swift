//
//  OnBoardingDissmiss.swift
//  Wetter
//
//  Created by Sven Kreußler on 09.01.24.
//
//  abstract: styling of dismiss button on boarding

import SwiftUI

struct OnBoardingDissmiss: View {
    
    // MARK: - Variables
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.black)
                .clipShape(Capsule())
                .padding(.bottom, 12)
                .padding(.horizontal, 24)
        }
    }
}

#Preview {
    OnBoardingDissmiss(title: "Start")
    {}
}
