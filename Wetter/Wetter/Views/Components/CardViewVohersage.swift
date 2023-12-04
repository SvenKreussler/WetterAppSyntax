//
//  CardViewVohersage.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI



struct CardViewVohersage: View {
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Aktuelle Zeitansage")
                .frame(alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                Divider()
                    .frame(height: 0.5)
                    .overlay(.black)
                
                
                List(locationFeaturesViewModel.weatherfeatures, id: \.self) { item in
                    Text(String(item.dt))
                    
                
                    
                    
                }
//                List(locationFeaturesViewModel.weatherfeatures, id: \.id) { item in
//                    
//                    Text(String(item.temp))
//                    Text("test")
//                    
//                    Text(String(item.dt))
//                    Text(String(item.degree))
//                    
//                    Image(systemName: item.icon)
//                        .scaledToFit()
//                    
//                    
//                }
                Text("test")
                
            }
            
            
            
        }
    }
    // MARK: - Variables
    
    @StateObject private var locationFeaturesViewModel = LocationFeaturesViewModel()
}

#Preview {
    CardViewVohersage()
}
