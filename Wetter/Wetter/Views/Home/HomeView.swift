//
//  HomeView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI
import CoreLocation



struct HomeView: View {
    var body: some View {
        
        
        TabView {
            ForEach(locationCurrent.weatherfeatures, id: \.lat ) { weatherFeature in
                VStack(spacing: 48) {
                    
                    HStack {
                        Text("Temperature: \(Int(round(weatherFeature.current.temp))) °C")
                        Text("Feels Like: \(Int(round(weatherFeature.current.feels_like))) °C")
                    }

                    CardViewVohersage()
                        .cardViewStyling()
                        .frame(width: 350, height: 100)
                        .environmentObject(locationCurrent)
                    
                    CardViewWochenVohersage()
                        .cardViewStyling()
                        .frame(width: 350, height: 300)
                        .environmentObject(locationCurrent)
                }
            }
            
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    // MARK: - Variables
    @StateObject private var locationCurrent = LocationFeaturesViewModel()
    
    
}



#Preview {
    HomeView()
}
