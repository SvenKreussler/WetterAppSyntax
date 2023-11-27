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
            Text("Wetterlage")

            HStack { ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                //TODO: Modell anpassen, das gewählter Tag auch selektiert wird
                
                item in
                VStack() {
                        Text(item.title.prefix(2))
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                        
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherFeaturesSelectDay()
}
