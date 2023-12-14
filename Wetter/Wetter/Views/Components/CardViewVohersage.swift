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
                    ForEach(locationCurrent.weatherfeatures, id: \.lat) { item in
                        ForEach(item.hourly, id: \.dt) { item in
                            VStack {
                                Text("\(formattedTime(for: item.dt))")
                                // ForEach weil let hourly: [Hourly] array
                                Text("\(Int(round(item.temp))) °C")
                            }
                            
                        }
   
                    }
                }
            }
        }
        
   
    }
    // MARK: - Functions
    func formattedTime(for timestamp: Int) -> String {
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm" // Use "hh:mm a" for 12-hour format with AM/PM
            return dateFormatter.string(from: date)
    }
    
    // MARK: - Variables
    
    @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
}

#Preview {
    CardViewVohersage()
        .environmentObject(LocationFeaturesViewModel())
}
