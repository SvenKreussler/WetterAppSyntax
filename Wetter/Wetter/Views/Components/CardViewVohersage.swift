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
                HStack(spacing: 24) {
                    
                    
                    
                    
                    
                    //                    ForEach(locationCurrent.weatherfeatures, id: \.lat) {
                    //                        item in
                    //                        Text(String("\(item.hourly.first)"))
                    //                    }
                    //                }
                    
                    
                    
                    
                    // MARK: - Variables
                    
                    //@ObservedObject var locationCurrent: LocationFeaturesViewModel
                    
                }
            }
        }
        
        
        
        
        //    #Preview {
        //        CardViewVohersage()
        //    }
        
    }
}
