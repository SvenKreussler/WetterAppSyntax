//
//  CardViewWochenListStyling.swift
//  Wetter
//
//  Created by Sven Kreußler on 09.01.24.
//

import SwiftUI

struct CardViewWochenListStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(.blue)
            .foregroundColor(.black)
    }
}

