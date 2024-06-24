////
////  LocationSearchViewModel.swift
////  Wetter
////
////  Created by Sven Kreußler on 29.11.23.
//
//
//
//
//import Foundation
//import CoreLocation
//
//class LocationSearchViewModel: ObservableObject, Identifiable {
//    
//    init(location: Location) {
//        self.location = location
//        self.id = location.id ?? UUID()
//        self.city = location.city ?? ""
//        self.lat = location.lat ?? 0.0
//        self.lon = location.lon ?? 0.0
//        
//    }
//
//    // MARK: - Variables
//    @Published var locations = [LocationList]()
//
//    
//    private let container = PersistentStore.shared
//    private let geocoder = CLGeocoder()
//    
//    let location: Location
//    let id: UUID
//    let city: String
//    let lat: Float
//    let lon: Float
//    
//    // MARK: - Functions
//    
//       
//    func coordinates(for cityName: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
//            geocoder.geocodeAddressString(cityName) { placemarks, error in
//                if let error = error {
//                    completion(nil, error)
//                } else if let placemark = placemarks?.first {
//                    completion(placemark.location?.coordinate, nil)
//                } else {
//                    completion(nil, NSError(domain: "YourApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No coordinates found for the provided city name."]))
//                }
//            }
//        }
//    
//    func delete() {
//        container.context.delete(location)
//        container.save()
//    }
//    
//    func save() {
//        let location = Location(context: container.context)
//        location.id = UUID()
//        location.city = city
//        location.lat = lat
//        location.lon = lon
//        
//        container.save()
//        
//    }
//}
