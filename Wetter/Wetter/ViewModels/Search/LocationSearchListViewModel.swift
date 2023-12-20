//
//  LocationSearchListViewModel.swift
//  Wetter
//
//  Created by Sven Kreußler on 19.12.23.
//

import Foundation
import CoreData

class LocationSearchListViewModel: Observable {
    
    init() {
        fetchLocations()
        
        let didSaveNotification = NSManagedObjectContext.didSaveObjectsNotification
        NotificationCenter.default.addObserver(self, selector: #selector(didSave(_:)), name: didSaveNotification, object: nil)
    }
    
    // MARK: - Variables
    
    private let container = PersistentStore.shared
    
    @Published var locationViewModels: [LocationViewModel] = []
    
    
    // MARK: - Functions
    
    @objc
    private func didSave(_ notification: Notification) {
        fetchLocations()
    }
    
    func fetchLocations() {
        let request = NSFetchRequest<Location>(entityName: "Wetter")
        request.sortDescriptors = [NSSortDescriptor(key: "city", ascending: true)]
        
        do {
            let locations = try container.context.fetch(request)
            self.locationViewModels = locations.map { LocationViewModel(location: $0) }
        } catch {
            print("error fetching: \(error)")
        }
    }
}
