//
//  OnbaordingHeader.swift
//  Wetter
//
//  Created by Sven Kreußler on 08.01.24.
//

import SwiftUI

struct OnbaordingHeader: View {
    var body: some View {
        HStack{
            Text("Wetter-APP")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/
                       ,alignment: .leading)
            Text("🌞")
        }.font(.largeTitle)
         .fontWeight(.heavy)
        
    }
}

#Preview {
    OnbaordingHeader()
}
