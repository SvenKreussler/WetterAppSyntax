//
//  WeatherFeaturesViewSheet.swift
//  Wetter
//
//  Created by Sven Kreußler on 24.11.23.
//
//  abstract: sheet for weather feature selection

import SwiftUI

struct WeatherFeaturesViewSheet: View {
    
    
    // MARK: - Variables
     @Binding var isPresented: Bool
     @State var selectFeatureButton: WeatherFeatureItem = .feelsLike
    
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 80) {
             WeatherFeaturesSelectDay()
                
           Button {
                
                isPresented = false
            } label: {
                Image(systemName: "x.circle")
                    .font(.system(size: 30))
                    .tint(Color.gray)
                    .buttonStyle(.borderedProminent)
                    .clipShape(Circle())
        }
        Divider()

         FeaturesSelectButton()
        
        WeatherFeaturesChart()
            .environmentObject(locationCurrent)
            
        }
        
        
        
    }
    
    // MARK: - Varibles
    
    @EnvironmentObject var locationCurrent: LocationFeaturesViewModel
}

//#Preview {
//    WeatherFeaturesViewSheet(isPresented: Binding<Bool>)
//
//    // WeatherFeaturesViewSheet(isPresented: .constant(true))
//}
