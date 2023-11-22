//
//  CardViewWochenVohersage.swift
//  Wetter
//
//  Created by Sven Kreußler on 22.11.23.
//

import SwiftUI

struct CardViewWochenVohersage: View {
    var body: some View {
        
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: false) {
                Text("Vohersage für 7 Tage")
                    .padding(.trailing, 120)
                ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                    item in
                    Divider()
//                        .frame(height: 0.5)
//                        .overlay(.black)
// Wirkt inkonsistent fünftes und viertes Element haben eine dickere Linie
                    
                    HStack {
                        Text(item.title)
                        
                        Text(item.degrees)
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
                
            }
        }
    }
    
}



#Preview {
    CardViewWochenVohersage()
}
