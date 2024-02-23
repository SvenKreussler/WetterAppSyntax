//
//  LocationSearchView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import SwiftUI

struct LocationSearchView: View {
    
    var body: some View {
        HStack {
            Text(city)
                .font(.headline)
            Spacer()
            DeleteButton(action: locationViewModel.delete)
                //.frame(width: 30)
        
        }.cardViewStyling()
            .frame(width: 350, height: 100)
        
    }
    
    // MARK: - Variables
    @ObservedObject var locationViewModel: LocationViewModel
    
    let city: String
}

#Preview {
    LocationSearchView(locationViewModel: .init(location: .init(context: PersistentStore.shared.context)), city: "test")
}
