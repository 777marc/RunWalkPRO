//
//  WorkoutView.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import SwiftUI
import MapKit

struct WorkoutView: View {
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 28.5383,
            longitude: -81.3792
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 20,
            longitudeDelta: 20
        )
    )
    
    var body: some View {
        
        VStack {
            Text("Current Workout")
            Map(coordinateRegion: $region)
                .navigationTitle("Locations")
            Text(message())
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
