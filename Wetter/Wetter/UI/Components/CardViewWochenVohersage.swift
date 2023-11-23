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
            Text("Vohersage für 7 Tage")
                .frame(width:200, height: 20, alignment: .leading)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(WochenvohersageItem.allCases, id:\.rawValue) {
                    item in
                    Divider()

                    
                    HStack {
                        Text(item.title)
                        
                        Text(item.degrees)
                        Image(systemName: item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Spacer()
                    }
                }
                
            }
        }
    }
    
}



#Preview {
    CardViewWochenVohersage()
}
