//
//  HomeView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI

//let backgroundGradient = LinearGradient(
//    colors: [Color.red, Color.green],
//    startPoint: .top, endPoint: .bottom)

struct HomeView: View {
    var body: some View {
        
//        ZStack {
//            backgroundGradient
//                .ignoresSafeArea()
            TabView {
                ForEach(LocationItem.allCases, id: \.rawValue) {
                    item in
                    VStack(spacing: 48) {
                        
                        Text(item.title)
                            .font(.largeTitle)
                            .bold()
                        Image(systemName: item.icon)
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
    //MARK: - Variables

    
}



#Preview {
    HomeView()
}
