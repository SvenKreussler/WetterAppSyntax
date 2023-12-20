//
//  PlaceHolderView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import SwiftUI

struct PlaceHolderView: View {
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.color)
            
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Variables
    
    let icon: String
    let title: String
}

#Preview {
    PlaceHolderView(icon: "plus", title: "Mehr")
}
