//
//  WeatherFeaturesSelectDay.swift
//  Wetter
//
//  Created by Sven Kreußler on 23.11.23.
//

import SwiftUI

struct WeatherFeaturesSelectDay: View {
    var body: some View {
        
        
            
        VStack {
            Text("Wetterlage für Tag")
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                    item in
                    //TODO: prüfen warum nicht horizontal
                    VStack {
                        
                        Text(item.title.prefix(2))
                    }
                }
            }
        }
        
    }
}

#Preview {
    WeatherFeaturesSelectDay()
}
