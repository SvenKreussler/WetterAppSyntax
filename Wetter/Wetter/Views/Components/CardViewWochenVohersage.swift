//
//  CardViewWochenVohersage.swift
//  Wetter
//
//  Created by Sven Kreußler on 22.11.23.
//

import SwiftUI

struct CardViewWochenVohersage: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Vohersage für 7 Tage")
                .frame(width: 200, height: 20, alignment: .leading)
            NavigationStack {
                ZStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(locationCurrent.weatherfeatures, id: \.lat) { city in
                            ForEach(city.daily, id: \.dt) { item in
                                NavigationLink (destination: WeatherFeaturesChart())
                                { HStack {
                                    
                                    Text("\(formattedTimeWeekDay(for: item.dt))")
                                        .frame(width: 60, height: 20, alignment: .leading)
                                    
                                    Text("\(Int(round(item.temp.day))) °C")
                                        .frame(width: 50, height: 20)
                                    Spacer()
                                }
                                }.padding()
                                 .background(.blue)
                                 .foregroundColor(.black)
                                
                            }
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    // @State private var path = NavigationPath()
    // @State var shouldShowEditTask = false
    @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
}



#Preview {
    CardViewWochenVohersage()
        .environmentObject(LocationFeaturesViewModel())
}
