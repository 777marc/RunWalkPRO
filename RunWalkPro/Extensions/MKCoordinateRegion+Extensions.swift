//
//  MKCoordinateRegion+Extensions.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 28.5383, longitude: -81.3792), latitudinalMeters: 100, longitudinalMeters: 100)
    }
    
}

// Orlando, FL USA
// latitude: 28.5383,
// longitude: -81.3792
