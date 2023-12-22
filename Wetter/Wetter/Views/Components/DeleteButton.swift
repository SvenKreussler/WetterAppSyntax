//
//  DeleteButton.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import SwiftUI

struct DeleteButton: View {
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 30)
 
                Image(systemName: "trash.fill")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
    }
    let action: () -> Void
}

#Preview {
    DeleteButton { }
}
