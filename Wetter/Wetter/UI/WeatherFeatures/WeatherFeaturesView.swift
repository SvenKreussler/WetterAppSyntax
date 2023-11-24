//
//  WeatherFeaturesView.swift
//  Wetter
//
//  Created by Sven Kreußler on 24.11.23.
//

import SwiftUI

struct WeatherFeaturesView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            WeatherFeaturesSelectDay()
        }
    }
    
}

#Preview {
    WeatherFeaturesView()
}
