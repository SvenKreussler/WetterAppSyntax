//
//  WeatherFeaturesViewSheet.swift
//  Wetter
//
//  Created by Sven Kreußler on 24.11.23.
//

import SwiftUI

struct WeatherFeaturesViewSheet: View {
    
    
    //MARK: - Variables
    @Binding var isPresented: Bool 
    @State var selectFeatureButton: WeatherFeatureItem = .feelsLike
    
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 70){
            WeatherFeaturesSelectDay()
                
            Button {
                
                isPresented = false
            } label: {
                Image(systemName: "x.circle")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .background(Color.black).grayscale(0.50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            
        }
        
        Divider()
            
        //WeatherFeaturesChart()
        
    }
    
    
    
}

#Preview {
    WeatherFeaturesViewSheet(isPresented: .constant(true))
}
