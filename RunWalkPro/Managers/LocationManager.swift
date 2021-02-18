//
//  LocationManager.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let locationsManager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        
        locationsManager.desiredAccuracy = kCLLocationAccuracyBest
        locationsManager.distanceFilter = kCLDistanceFilterNone
        locationsManager.requestWhenInUseAuthorization()
        locationsManager.startUpdatingLocation()
        locationsManager.delegate = self
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        DispatchQueue.main.async {
            self.location = location
        }
    }
    
}
