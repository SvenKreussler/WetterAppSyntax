//
//  LocationSearchListView.swift
//  Wetter
//
//  Created by Sven Kreußler on 21.11.23.
//

import SwiftUI
import CoreLocation

struct LocationSearchListView: View {
    
       
    var body: some View {
        NavigationStack {
            Group {
                if locationSearchListViewModel.locationSearchViewModels.isEmpty {
                    PlaceHolderView(icon: "globe", title: "Suche einen Ort aus!")
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(locationSearchListViewModel.locationSearchViewModels, id: \.id) {
                                viewModel in
                                Text(viewModel.city)
                            }
                        }
                    }
                }
            }.navigationTitle("Location")
                .toolbar {
                    Button(action:addLocation) {
                        Image(systemName: "plus.circle.fill")
                    }.sheet(isPresented: $showAddLocation) {
                        LocationEditView(isPresented: $showAddLocation)
                    }
                }

        }
        
    }
    
    // MARK: - Variables
    
    @State private var showAddLocation = false
    
    @StateObject private var locationSearchListViewModel = LocationSearchDetailViewModel()
    
    // MARK: - Functions
    private func addLocation() {
        showAddLocation.toggle()
    }
    
}



#Preview {
    LocationSearchListView()
}
