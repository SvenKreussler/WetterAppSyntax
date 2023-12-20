//
//  LocationEditView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import SwiftUI

struct LocationEditView: View {
    
    var body: some View {
        NavigationStack {
            Section("Ort") {
                VStack {
                    TextField("Location", text: $locationDetailViewModel.city)
                    
                }
                Button(action: save) {
                    Text("Speichern")
                }
                .disabled(locationDetailViewModel.disableSaving)
            }
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
    
    
    @Binding var isPresented: Bool
    @StateObject private var locationDetailViewModel = LocationSearchDetailViewModel()
    
    // MARK: - Functions
    
    private func dismissView() {
        isPresented.toggle()
    }
    
    private func save() {
        locationDetailViewModel.save()
        dismissView()
    }
}

#Preview {
    LocationEditView(isPresented: .constant(false))
}
