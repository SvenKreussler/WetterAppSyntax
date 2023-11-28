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
            Picker("", selection: $selectedFeature) {
                ForEach(WeatherFeatureItem.allCases, id:\.self) { item in
                    Image(systemName: item.icon)
                        
                }
            }.pickerStyle(.menu)
                .tint(Color.gray)
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
            

        }
        
    }
    //MARK: - Variables
    @State private var selectedFeature: WeatherFeatureItem = .rainChance
}

#Preview {
    FeaturesSelectButton()
}
