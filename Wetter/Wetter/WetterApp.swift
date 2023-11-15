//
//  WetterApp.swift
//  Wetter
//
//  Created by Sven Kreußler on 15.11.23.
//

import SwiftUI

@main
struct WetterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
