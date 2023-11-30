//
//  CardViewVohersage.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI



struct CardViewVohersage: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Aktuelle Zeitansage")
                .frame(alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                Divider()
                    .frame(height: 0.5)
                    .overlay(.black)
                
                HStack { ForEach(TagesvohersageItem.allCases, id: \.rawValue) { item in
                    VStack {
                        
                        Text(item.title)
                        Text(item.degree)
                        
                        Image(systemName: item.icon)
                            .scaledToFit()
                        
                    }
                }
                }
            }
        }
    }
}

#Preview {
    CardViewVohersage()
}
