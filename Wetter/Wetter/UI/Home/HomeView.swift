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
                    
                    CardViewVohersage()
                        .frame(width: 300, height: 150)
                        .padding(24)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                    CardViewWochenVohersage()
                        .frame(width: 300, height: 200)
                        .padding(24)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                    
                }
            }
            
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    HomeView()
}
