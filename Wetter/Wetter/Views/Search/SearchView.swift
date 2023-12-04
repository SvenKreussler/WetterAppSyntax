//
//  SearchView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI
import MapKit


// https://youtu.be/e0eO1di0cPY?t=1413
// string mit textfield auf server suchen

struct SearchView: View {
    
    private let  locationsList = [LocationSearch(id: UUID(), name: "Berlin", lat: 44.00, lon: 23.00),
                        LocationSearch(id: UUID(), name: "München", lat: 23.23, lon: 22.22),
                        LocationSearch(id: UUID(), name: "Hamburg", lat: 23.23, lon: 23.23)]
    
    
    
    var body: some View {
        
        
        NavigationStack {
            List(locationsList) { item in
                VStack {
                    Text(item.name)
                        .font(.system(size: 46))
                }.padding(32)
                    .frame(width: 300, height: 100)
                    .cardViewStyling()
            }.listStyle(.plain)
                .searchable(text: $searchText)
            
            
        }
    }
    // MARK: - Variables
    @State private var searchText: String = ""
    
}

#Preview {
    SearchView()
}
