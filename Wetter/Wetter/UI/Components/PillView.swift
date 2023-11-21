//
//  PillView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//

import SwiftUI

struct PillView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                .fill(.blue)
                .frame(height: 300)
                .shadow(radius: 10)
            
            VStack {
                Text("Aktuelle Zeitansage")

                ForEach(TagesvohersageItem.allCases, id: \.rawValue) {
                    item in
                    HStack {
                        Text(item.title)

                    }
                }

            }.padding()
        }
        Spacer()
        
    }
}

#Preview {
    PillView()
}
