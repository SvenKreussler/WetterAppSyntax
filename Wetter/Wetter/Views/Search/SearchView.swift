//
//  SearchView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI


struct SearchView: View {
    
    private let  locationList = [LocationSearch(id: UUID(), name: "Berlin", lat: 44.00, lon: 23.00),
                        LocationSearch(id: UUID(), name: "München", lat: 23.23, lon: 22.22),
                        LocationSearch(id: UUID(), name: "Hamburg", lat: 23.23, lon: 23.23)]
    
    var body: some View {
        
        
        
            List(locationList) {
                item in
                VStack {
                    Text(item.name)
                        .font(.system(size: 46))
                }.padding(32)
                    
                    .frame(width: 300, height: 100)
            }
    }
    
}

#Preview {
    SearchView()
}
