//
//  LocationEditView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//
//  abstract: sheet for user providing location String

import SwiftUI
import CoreLocation

struct LocationEditView: View {
    
    var body: some View {
        NavigationStack {
            
            Form {
                VStack {
                    TextField("Location", text: $locationDetailViewModel.city)
                }
            }
            Button(action: save) {
                Text("Speichern")
            }
            .disabled(locationDetailViewModel.disableSaving)
            
            .navigationTitle("Location")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: dismissView) {
                    Image(systemName: "xmark.circle.fill")
                }
                
                
            }
        }
    }
    
    // MARK: - Variables
    
    
    @State var errorMessage: String?
    @State var coordinates: CLLocationCoordinate2D?
    
    private let locationManager = LocationSearchDetailViewModel()
    private let clLocationManager = CLLocationManager()
    
    @Binding var isPresented: Bool
    
    // change of var from "locationDetailViewModel" to "persistentLocation "
    @StateObject var locationDetailViewModel = LocationSearchDetailViewModel()
    
    // MARK: - Functions
    
    private func dismissView() {
        isPresented.toggle()
    }
    
    private func save() {
        locationDetailViewModel.coordinates(for: locationDetailViewModel.city) { coordinates, error in
            if let coordinates = coordinates {
                
                LocationSearchDetailViewModel.shared.save(cityName: locationDetailViewModel.city, coordinates: coordinates)
                dismissView()
                
            } else {
                errorMessage = "Failed to obtain coordinates: \(error?.localizedDescription ?? "Unknown error")"
            }
        }
    }
}

#Preview {
    LocationEditView(isPresented: .constant(true))
}
