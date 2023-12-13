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

                        Text("Test: \(item.current.temp)")
                        Text("Feels Like: \(item.current.feels_like)")
                        
                    }

                    CardViewVohersage()
                        .cardViewStyling()
                        .frame(width: 350, height: 100)
                        
                    
                    CardViewWochenVohersage()
                        .cardViewStyling()
                        .frame(width: 350, height: 300)
                        
                }
            }
            
        }
        
        
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    // MARK: - Variables
    @ObservedObject var locationCurrent: LocationFeaturesViewModel

}



#Preview {
    HomeView(locationCurrent: LocationFeaturesViewModel())
}
