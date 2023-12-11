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
                    
                    
                    
//                    if let locationCurrent = locationCurrent {
//                        List(locationCurrent.weatherfeatures, id: \.lat) {
//                            item in
//                            Text(String("\(item.hourly.first)"))
//                        }
//                    }
                    
                    ForEach(locationCurrent.weatherfeatures , id: \.lat) {
                            item in
                            Text(String("\(item.hourly.first)"))
                        }
                }
                
//                HStack(spacing: 24) { 
//                    List {
//                        ForEach(locationCurrent.weatherfeatures, id: \.dt) { hourly in
//                                        
//                            Text(String(hourly.temp))
//                                }
//                        }
//                }
                
            }
        }
        
        // MARK: - Variables
        
        @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
        
    }
}

//struct HourlyRow: View {
//    var hourly: Hourly
//
//    var body: some View {
//        HStack {
//            Text("Time: \(formattedTime(from: TimeInterval(hourly.dt))), Temp: \(hourly.temp)")
//            // Add other hourly row content as needed
//        }
//    }
//
//    private func formattedTime(from timestamp: TimeInterval) -> String {
//        let date = Date(timeIntervalSince1970: timestamp)
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        return formatter.string(from: date)
//    }
//}

#Preview {
    CardViewVohersage()
}

