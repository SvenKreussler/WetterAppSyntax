//
//  LocationDetailViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 20.12.23.
//

import Foundation
import CoreData

class LocationSearchDetailViewModel: ObservableObject {
    
    
    init() {
        // fetchLocations()
        
//        let didSaveNotification = NSManagedObjectContext.didSaveObjectsNotification
//        NotificationCenter.default.addObserver(self, selector: #selector(didSave(_:)), name: didSaveNotification, object: nil)
    }
    
    // MARK: - Variables
    
    private let container = PersistentStore.shared
    
    @Published var locationSearchViewModels: [LocationViewModel] = []
    
    @Published var city = ""
    
    // MARK: - Computed Properties
    
    var disableSaving: Bool {
        city.isEmpty
    }
    
    // MARK: - Functions
    
    func save() {
        let location = Location(context: container.context)
        location.id = UUID()
        location.city = city
    }
    
//    @objc
//    private func didSave(_ Notification: Notification) {
//        fetchlocations()
//    }
    
//    func fetchlocations() {
//        let request = NSFetchRequest<Location>(entityName: "Location")
//        request.sortDescriptors = [NSSortDescriptor(key: "city", ascending: true)]
//        
//        do {
//            let locations = try container.context.fetch(request)
//            self.locationSearchViewModels = locations.map {
//                LocationViewModel(location: $0) }
//        } catch {
//            print("error fetching: \(error)")
//        }
//    }
}


