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
            Text(locationViewModel.city)
                .font(.headline)
                .cardViewStyling()
            
        }
        // unklar, warum Newline gebraucht wird, damit Funktion erkannt wird
        DeleteButton(action: locationViewModel.delete)
    }
    
    // MARK: - Variables
    @ObservedObject var locationViewModel: LocationViewModel
    
}

#Preview {
    LocationSearchView(locationViewModel: .init(location: .init(context: PersistentStore.shared.context)))
}
