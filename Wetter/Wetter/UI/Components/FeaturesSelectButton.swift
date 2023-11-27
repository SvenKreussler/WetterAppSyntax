//
//  FeaturesSelectButton.swift
//  Wetter
//
//  Created by Sven Kreußler on 27.11.23.
//

import SwiftUI

struct FeaturesSelectButton: View {
    var body: some View {
        
        HStack(spacing:120) {
            //zusammenfassung des Wochentages als icon und Text
            VStack {
                Text(LocationItem.berlin.title)
                    .font(.largeTitle)
                Image(systemName: WochenvohersageItem.heute.icon)
                    .font(.largeTitle)
            }
            
            Button(action: {
                List {
                    ForEach(WeatherFeatureItem.allCases, id:\.rawValue) { item in
                        Text(item.title)
                        Image(systemName: item.icon)
                    }
                }
                
                
            }, label: {
                Image(systemName: WeatherFeatureItem.rainChance.icon)
                Image(systemName: "arrow.down")
            })
            .tint(Color.gray)
            .buttonStyle(.borderedProminent)
            .clipShape(.capsule)
        }
        
    }
}

#Preview {
    FeaturesSelectButton()
}
