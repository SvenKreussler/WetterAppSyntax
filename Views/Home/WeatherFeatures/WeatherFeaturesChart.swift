//
//  WeatherFeaturesChart.swift
//  Wetter
//
//  Created by Sven Kreußler on 24.11.23.
//
//  abstract: graph for selected whether feature

import SwiftUI
import Charts

// https://developer.apple.com/documentation/charts/linemark



struct WeatherFeaturesChart: View {
    
    var body: some View {
        Chart {
            ForEach(TagesvohersageItem.allCases, id: \.title) { item in
                LineMark(
                    x: .value("Month", item.title),
                    y: .value("Hours of Sunshine", item.degree)
                ).interpolationMethod(.catmullRom)
            }
        }
    }
}

#Preview {
    WeatherFeaturesChart()
}
