//
//  WeatherFeaturesSelectDay.swift
//  Wetter
//
//  Created by Sven Kreußler on 23.11.23.
//

import SwiftUI

struct WeatherFeaturesSelectDay: View {
    var body: some View {
        
        HStack(alignment: .top) {
            Text("Wetterlage für Tag")
                .frame(alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                    item in
                    
                        Text(item.title.prefix(2))
                    
                }
            }
        }
        
    }
}

#Preview {
    WeatherFeaturesSelectDay()
}
