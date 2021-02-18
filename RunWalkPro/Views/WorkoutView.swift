//
//  WorkoutView.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import SwiftUI
import MapKit
import Combine

struct WorkoutView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion.defaultRegion
    @State private var cancellable: AnyCancellable?
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
        }
    }
    
    var body: some View {
        
        VStack {
            if locationManager.location != nil {
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
            } else {
                Text("Locating user location...")
            }
            
        }
        
        .onAppear {
            print("on appear")
            setCurrentLocation()
        }
        
    }
}

func message() -> String {
    return "Hey this is a message"
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
