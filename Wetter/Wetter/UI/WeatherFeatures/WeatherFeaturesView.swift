//
//  WeatherFeaturesView.swift
//  Wetter
//
//  Created by Sven Kreußler on 24.11.23.
//

import SwiftUI

struct WeatherFeaturesView: View {
    
    //https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-a-view-dismiss-itself
    //MARK: - Variables
    @Binding var isPresented: Bool 
    
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 80) {
            WeatherFeaturesSelectDay()
            Button {
                print("this is fine")
                isPresented = false
            } label: {
                Image(systemName: "x.circle")
                    .font(.title)
            }
            
        }
    }
    
}

#Preview {
    WeatherFeaturesView(isPresented: .constant(true))
}
