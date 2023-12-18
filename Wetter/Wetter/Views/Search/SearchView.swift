//
//  SearchView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    
    @State private var searchQuery = ""
    @State private var coordinates: CLLocationCoordinate2D?
    
    private let  locationsList = [LocationSearch(id: UUID(), name: "Berlin", lat: 44.00, lon: 23.00),
                                  LocationSearch(id: UUID(), name: "München", lat: 23.23, lon: 22.22),
                                  LocationSearch(id: UUID(), name: "Hamburg", lat: 23.23, lon: 23.23)]
    
    var body: some View {
        
        SearchBar(text: $searchQuery)
            .padding()
        
        if let coordinates = coordinates {
            Text("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
                .padding()
        } else {
            Text("Location not found")
                .padding()
        }
        
        NavigationStack {
            List(locationsList) { item in
                VStack {

                    Text(item.name)
                        .font(.system(size: 46))
                }.padding(32)
                    .frame(width: 300, height: 100)
                    .cardViewStyling()
            }.listStyle(.plain)
            // .searchable(text: $searchText)
            
            
        }
    }
    // MARK: - Functions
    
    func performGeocoding() {
        geocodeAddress(searchQuery) { (coordinate, error) in
            if let coordinate = coordinate {
                self.coordinates = coordinate
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    
    // MARK: - Variables
    @State private var searchText: String = ""
    
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search for a location", text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}

#Preview {
    SearchView()
}
