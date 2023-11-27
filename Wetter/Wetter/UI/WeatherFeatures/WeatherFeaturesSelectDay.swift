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
            HStack(spacing: 80) {
                Text("Wetterlage für Tag")
                
                
            }
            HStack { ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                item in
                
                VStack() {
                    Text(item.title.prefix(2))
                    //Spacer()
                    
                }
            }
            }
        }
        
        
        
    }
}

#Preview {
    WeatherFeaturesSelectDay()
}
