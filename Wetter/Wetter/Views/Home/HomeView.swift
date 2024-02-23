//
//  HomeView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
            

        TabView {

            ForEach(locationCurrent.weatherfeatures, id: \.lat ) { item in
                ForEach(locationCurrent.locationViewModels, id: \.city) {
                    item in
                    Text("Stadt: \(item.city), Koordinaten: \(item.lat), \(item.lon)")
                }
                
                VStack(spacing: 48) {
                    
                    
                    HStack {
                        Text("Temperature: \(Int(round(item.current.temp))) °C")
                        Text("Feels Like: \(Int(round(item.current.feels_like))) °C")
                        
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
    
    @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // @EnvironmentObject var locationSearchListViewModel: LocationSearchListViewModel
    
}

#Preview {
    HomeView()
        .environmentObject(LocationFeaturesViewModel())
        // .environment(viewContext)
        
}
