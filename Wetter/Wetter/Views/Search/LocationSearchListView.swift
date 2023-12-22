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
//            Group {
//                if locationSearchListViewModel.locationViewModels.isEmpty {
//                    
//                    //PlaceHolderView(icon: "Globe", title: "Endecke die Welt!")
//                } else {
//                    ScrollView(showsIndicators: false) {
//                        VStack {
//                            ForEach($locationSearchListViewModel.locationSearchViewModels, id: \.id) { viewModel in
//                                LocationSearchView(locationViewModel: viewModel)
//                            }
//                        }
//                    }
//                }
//            }
            
            List(locationSearchListViewModel.locationViewModels) {
                viewmodel in
                LocationSearchView(locationViewModel: viewmodel, city: viewmodel.city)
            }.listStyle(.plain)
                
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
    
    @ObservedObject private var locationSearchListViewModel = LocationSearchListViewModel()

    // MARK: - Functions
    private func addLocation() {
        showAddLocation.toggle()
    }
}

#Preview {
    LocationSearchListView()
}
