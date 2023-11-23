//
//  CardViewStyling.swift
//  Wetter
//
//  Created by Sven Kreußler on 23.11.23.
//

import SwiftUI

struct CardViewStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 150)
            .padding(24)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

extension View {
    func cardViewStyling() -> some View {
        modifier(CardViewStyling())
    }
}
