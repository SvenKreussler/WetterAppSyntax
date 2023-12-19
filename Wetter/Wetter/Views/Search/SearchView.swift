//
//  SearchView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    
    // TODO: prüfen Sie wie ein Parameter zu dem Fetch übergeben werden kann.
    // TODO: Prüfen Sie die gespeicherten Daten persistent gespeichert werden können
    
    @State private var searchQuery = ""
    
    @State private var locations: [LocationList] = []
    
    private let  locationsList = [LocationSearch(id: UUID(), name: "Berlin", lat: 44.00, lon: 23.00),
                                  LocationSearch(id: UUID(), name: "München", lat: 23.23, lon: 22.22),
                                  LocationSearch(id: UUID(), name: "Hamburg", lat: 23.23, lon: 23.23)]
    
    var body: some View {
        

        NavigationView {
            List(locationsList) { item in
                VStack {
                    
                    
                }.padding(32)
                    .frame(width: 300, height: 100)
                    .cardViewStyling()
            }.listStyle(.plain)
                .searchable(text: $searchText) {
                    
                }
        }
    }
    // MARK: - Functions
    // print(locationSearchViewModel.fetchData())
    
    
    
    // MARK: - Variables
    @State private var searchText = ""
    @StateObject var locationSearchViewModel = LocationSearchViewModel()
    
}



#Preview {
    SearchView()
}
