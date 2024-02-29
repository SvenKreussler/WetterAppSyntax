//
//  LocationSearchListView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//
//  abstract: View of user provided location items

import SwiftUI
import CoreLocation

struct LocationSearchListView: View {
    
    
    var body: some View {
        NavigationStack {
            List(locationSearchListViewModel.locationViewModels) { viewmodel in
                LocationSearchView(locationViewModel: viewmodel, city: viewmodel.city)
                
            }
                       
            .listStyle(.plain)
            .navigationTitle("Location")
            .toolbar {
                Button(action: addLocation) {
                    Image(systemName: "plus.circle.fill")
                }
            }.sheet(isPresented: $showAddLocation) {
                LocationEditView(isPresented: $showAddLocation)
            }
        }
        
    }
    
    
    // MARK: - Variables
    
    @State private var showAddLocation = false
    
    @ObservedObject var locationSearchListViewModel = LocationSearchListViewModel()
    
    // MARK: - Functions
    private func addLocation() {
        showAddLocation.toggle()
    }
}

#Preview {
    LocationSearchListView()
}
