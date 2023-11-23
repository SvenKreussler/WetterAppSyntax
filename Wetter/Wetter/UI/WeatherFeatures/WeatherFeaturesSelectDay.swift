//
//  WeatherFeaturesSelectDay.swift
//  Wetter
//
//  Created by Sven Kreußler on 23.11.23.
//

import SwiftUI

struct WeatherFeaturesSelectDay: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                    item in
                    Text(item.title.prefix(2))
                }
            }
        }
    }
}

#Preview {
    WeatherFeaturesSelectDay()
}
