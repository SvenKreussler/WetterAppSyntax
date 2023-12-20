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
            VStack {
                TextField("Location", text: $LocationDetailViewModel.city)
                
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
    @StateObject private var locationDetailViewModel = LocationDetailViewModel()
    
    // MARK: - Functions
    
    private func dismissView() {
        isPresented.toggle()
    }
}

#Preview {
    LocationEditView(isPresented: .constant(false))
}
