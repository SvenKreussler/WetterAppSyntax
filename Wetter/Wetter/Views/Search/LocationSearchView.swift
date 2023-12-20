//
//  LocationSearchView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI
import CoreLocation

struct LocationSearchView: View {
    
    private let  locationsList = [LocationSearch(id: UUID(), name: "Berlin", lat: 44.00, lon: 23.00),
                                  LocationSearch(id: UUID(), name: "München", lat: 23.23, lon: 22.22),
                                  LocationSearch(id: UUID(), name: "Hamburg", lat: 23.23, lon: 23.23)]
    
    var body: some View {
        NavigationStack {
            List(locationsList) { item in
                VStack { Text(item.name) }
                    .padding(32)
                    .frame(width: 300, height: 100)
                    .cardViewStyling()
            }
            .listStyle(.automatic)
            .navigationTitle("Location")
            .toolbar {
                Button(action: addLocation) {
                    
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showAddLocation) {
                LocationEditView(isPresented: $showAddLocation)
            }
        }
        
    }
    
    // MARK: - Variables
    
    @State private var showAddLocation = false
    
    // MARK: - Functions
    private func addLocation() {
        showAddLocation.toggle()
    }

}


    
#Preview {
    LocationSearchView()
}
