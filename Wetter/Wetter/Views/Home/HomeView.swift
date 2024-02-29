//
//  HomeView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//
//  abstract: homeview for location view

import SwiftUI


struct HomeView: View {
    
    var body: some View {
        TabView {
            ForEach(locationCurrent.mergedData, id: \.city) { mergedData in
                
                VStack(spacing: 24) {
                    HStack {
                        Text("City: \(mergedData.city)")
                            .font(.largeTitle)
                    }
                    
                    Text("Temperature: \(Int(round(mergedData.weatherFeature.current.temp))) °C")
                    Text("Feels Like: \(Int(round(mergedData.weatherFeature.current.feels_like))) °C")
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
    
    @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var locationSearchListViewModel: LocationSearchListViewModel
    
}

#Preview {
    HomeView()
        .environmentObject(LocationFeaturesViewModel())
    
    //.environmentObject(LocationSearchListViewModel())
    
}
