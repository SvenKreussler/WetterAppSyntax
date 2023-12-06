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
            
//            ForEach(locationCurrent.weatherfeatures, id: \.id) { item in
//                Text("\(item.current.dt)")
//            }
            
            
            ForEach(LocationItemEnum.allCases, id: \.self) { item in
                VStack(spacing: 48) {
                    
                    Text(item.title)
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: item.icon)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .font(.system(size: 96))
                    
                    
                    CardViewVohersage()
                        .cardViewStyling()
                        .frame(width: 350, height: 100)
                    
                    CardViewWochenVohersage()
                        .cardViewStyling()
                        .frame(width: 350, height: 300)
                }
            }
            
        }
        
        
        VStack {
            Text("Weather Features:")
            
            List(locationCurrent.weatherfeatures, id: \.lat ) {
                weatherFeature in
                VStack(alignment: .leading) {
                    
                    Text("Temperature: \(Int(round(weatherFeature.current.temp)))")
                    Text("Feels Like: \(Int(round(weatherFeature.current.feels_like)))")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.vertical, 5)
            }
            .onAppear {
                locationCurrent.fetchData()
                
            }
            
        }
        
            
        
        
    }
    // MARK: - Variables
    @StateObject private var locationCurrent = LocationFeaturesViewModel()
    
    
}



#Preview {
    HomeView()
}
