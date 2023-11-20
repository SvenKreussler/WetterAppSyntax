//
//  PillView.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.11.23.
//

import SwiftUI

struct PillView: View {
    struct wettermockup {
        var zeitpunkt = ""
        var gradzahl = 0
        var grafik =  ""
        init (zeitpunkt:String, gradzahl: Int, grafik: String ) {
            self.zeitpunkt = zeitpunkt
            self.gradzahl = gradzahl
            self.grafik = grafik
        }
    }
    
    //var fakedata = [wettermockup]()
    var weatherarray = [
        wettermockup(zeitpunkt: "Jetzt", gradzahl: 23, grafik: "sun.max"),
        wettermockup(zeitpunkt: "13:00", gradzahl: 21, grafik: "sun.haze"),
        wettermockup(zeitpunkt: "15:00", gradzahl: 18, grafik: "sun.max"),
        wettermockup(zeitpunkt: "17:00", gradzahl: 23, grafik: "sun.max"),
        wettermockup(zeitpunkt: "19:00", gradzahl: 23, grafik: "cloud.sun.rain")]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                .fill(.blue)
                .frame(height: 300)
                .shadow(radius: 10)
            
            VStack {
                Text("Aktuelle Zeitansage")
                    .padding([.bottom, .bottom], 160)
                Text("Jetzt \n 23 \n grafik")
//                weatherarray.forEach() {
//                    weather in
//                    print(weather)
//                }
            }.padding()
        }
        
        Spacer()
        
    }
}

#Preview {
    PillView()
}
