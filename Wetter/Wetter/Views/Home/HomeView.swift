//
//  HomeView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI

//    let backgroundGradient = LinearGradient(
//    colors: [Color.red, Color.green],
//    startPoint: .top, endPoint: .bottom)

struct HomeView: View {
    var body: some View {
        
//        ZStack {
//            backgroundGradient
//                .ignoresSafeArea()
            TabView {
                ForEach(LocationItem.allCases, id: \.self) { item in
                    VStack(spacing: 48) {
                        Text(item.title)
                            .font(.largeTitle)
                            .bold()
                        Image(systemName: item.icon)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .font(.system(size: 96))
                        
                        
                        CardViewVohersage()
                            .cardViewStyling()
                            .frame(width: 350, height: 100)
                        
                        CardViewWochenVohersage()
                            .cardViewStyling()
                            .frame(width: 350, height: 300)
                    }
                }
                
            }
            
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
    // MARK: - Variables
    
    
}



#Preview {
    HomeView()
}
