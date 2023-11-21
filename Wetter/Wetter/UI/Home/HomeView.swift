//
//  HomeView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
        
        TabView {
            ForEach(LocationItem.allCases, id: \.rawValue) {
                item in
                VStack(spacing: 12) {
                    Image(systemName: item.icon)
                        .font(.largeTitle)
                    Text(item.title)
                        .font(.headline)
                }
                .frame(width: 200, height: 200)
                
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    HomeView()
}
