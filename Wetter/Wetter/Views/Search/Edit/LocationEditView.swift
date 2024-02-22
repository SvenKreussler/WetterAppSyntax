//
//  LocationEditView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

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
    
    @State private var cityName = ""
    @State private var errorMessage: String?
    @State private var coordinates: CLLocationCoordinate2D?
    
    private let locationManager = LocationSearchDetailViewModel()
    private let clLocationManager = CLLocationManager()
    
    @Binding var isPresented: Bool
    @StateObject private var locationDetailViewModel = LocationSearchDetailViewModel()
    
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
    
    
    private func requestLocationAuthorization() {
        // Request "When In Use" authorization for location services
        clLocationManager.requestWhenInUseAuthorization()
        
        // Check the current authorization status
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // Authorization granted, proceed with location retrieval
            fetchCoordinates()
        case .denied, .restricted:
            errorMessage = "Location access is denied. Please enable it in Settings."
        case .notDetermined:
            // Authorization not determined yet, handle this case if needed
            errorMessage = "Location authorization is not determined."
        @unknown default:
            errorMessage = "An unknown error occurred."
        }
    }
    
    private func fetchCoordinates() {
        locationManager.coordinates(for: locationDetailViewModel.city) { result, error in
            if let result = result {
                coordinates = result
                errorMessage = nil
            } else if let error = error {
                errorMessage = "Error: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    LocationEditView(isPresented: .constant(true))
}
