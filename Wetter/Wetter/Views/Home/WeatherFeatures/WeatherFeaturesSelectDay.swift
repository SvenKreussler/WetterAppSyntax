//
//  WeatherFeaturesSelectDay.swift
//  Wetter
//
//  Created by Sven Kreußler on 23.11.23.
//
//  abstract: selected weekday binding View
import SwiftUI

struct WeatherFeaturesSelectDay: View {
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text("Wetterlage")
            
            HStack { ForEach(WochenvohersageItem.allCases, id: \.rawValue) { item in
                // TODO: Modell anpassen, das gewählter Tag auch selektiert wird
                
                
                VStack {
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
