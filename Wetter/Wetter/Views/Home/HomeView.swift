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
                VStack(spacing: 48) {
 
                    HStack {

                        Text("Temperature: \(Int(round(item.current.temp))) °C")
                        Text("Feels Like: \(Int(round(item.current.feels_like))) °C")
                        
                    }
                    
                    CardViewVohersage()
                        .environmentObject(locationCurrent)
                        .cardViewStyling()
                        .frame(width: 350, height: 100)
                        
                        
                    
                    CardViewWochenVohersage()
                        .environmentObject(locationCurrent)
                        .cardViewStyling()
                        .frame(width: 350, height: 300)
                        
                        
                }
            }
            
        }
        
        
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    // MARK: - Variables
    @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
    

}



#Preview {
    HomeView()
        .environmentObject(LocationFeaturesViewModel())
}
