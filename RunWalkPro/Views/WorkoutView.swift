//
//  WorkoutView.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import SwiftUI
import MapKit
import Combine

struct StopWatchButton : View {
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    var body: some View {
        let buttonWidth = (UIScreen.main.bounds.size.width / 2) - 12
        
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 50)
            }
        }
        .background(self.color)
    }
}


struct WorkoutView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion.defaultRegion
    @State private var cancellable: AnyCancellable?
    @State var lastLat: Double
    @State var lastLon: Double
    @State var distance: Double = 0
    @ObservedObject var stopWatch = StopWatch()
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)

            var lastLoc: CLLocation
            var currentLoc: CLLocation

            if lastLat == 0.0 {
                lastLat = locationManager.location!.coordinate.latitude
                lastLon = locationManager.location!.coordinate.longitude
            }
            
            if locationManager.location!.coordinate.latitude > 0 {
                lastLoc = CLLocation(latitude: lastLat, longitude: lastLon)
                currentLoc = CLLocation(latitude: locationManager.location!.coordinate.latitude, longitude: locationManager.location!.coordinate.longitude)
                distance += lastLoc.distance(from: currentLoc)
            }
                        
            lastLat = locationManager.location!.coordinate.latitude
            lastLon = locationManager.location!.coordinate.longitude
        }
    }
    
    var body: some View {
        
        VStack {
            
            Text(self.stopWatch.stopWatchTime)
                .font(.custom("courier", size: 50))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.size.width,
                       height: 100,
                       alignment: .center)
            
            HStack{
                StopWatchButton(actions: [self.stopWatch.reset, self.stopWatch.lap],
                                labels: ["Reset", "Lap"],
                                color: Color.red,
                                isPaused: self.stopWatch.isPaused())

                StopWatchButton(actions: [self.stopWatch.start, self.stopWatch.pause],
                                labels: ["Start", "Pause"],
                                color: Color.blue,
                                isPaused: self.stopWatch.isPaused())
            }
            
            VStack(alignment: .leading) {
                Text("Laps")
                    .font(.title)
                    .padding()

                List {
                    ForEach(self.stopWatch.laps, id: \.uuid) { (lapItem) in
                        Text(lapItem.stringTime)
                    }
                }
            }
            
            
            
            if locationManager.location != nil {
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
                    .padding()
                
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
