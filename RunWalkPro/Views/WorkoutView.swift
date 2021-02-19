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
    @State var lastLat: Double
    @State var lastLon: Double
    @State var distance: Double = 0
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
            print("in set")
            
            var lastLoc = CLLocation(latitude: lastLat, longitude: lastLon)
            
            var currentLoc = CLLocation(latitude: locationManager.location!.coordinate.latitude, longitude: locationManager.location!.coordinate.longitude)
            
            distance += lastLoc.distance(from: currentLoc)
            
            print(distance)
            
            lastLat = locationManager.location!.coordinate.latitude
            lastLon = locationManager.location!.coordinate.longitude
        }
    }
    
    var body: some View {
        
        VStack {
            if locationManager.location != nil {
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
                
                Text("Lat:\(lastLat)")
                    .font(.system(size: 20))

                Text("Lon:\(lastLon)")
                    .font(.system(size: 20))
                
                Text("Distance:\(distance)")

                
            } else {
                Text("Locating user location...")
            }
            

        }
        
        .onAppear {
            setCurrentLocation()
        }
        
    }
}

func message() -> String {
    return "Hey this is a message"
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        let lat = 0.0
        let lon = 0.0
        let dist = 0.0
        WorkoutView(lastLat: lat, lastLon: lon, distance: dist)
    }
}
