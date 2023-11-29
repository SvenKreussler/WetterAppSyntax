//
//  WeatherFeaturesChart.swift
//  Wetter
//
//  Created by Sven Kreußler on 24.11.23.
//

import SwiftUI
import Charts

//https://developer.apple.com/documentation/charts/linemark



struct WeatherFeaturesChart: View {
    
    var body: some View {
        Chart(TagesvohersageItem.allCases, id:\.self) {
                LineMark(
                    x: .value("Month", $0.title),
                    y: .value("Hours of Sunshine", $0.degree)
                )
            }
    }
}

#Preview {
    WeatherFeaturesChart()
}
