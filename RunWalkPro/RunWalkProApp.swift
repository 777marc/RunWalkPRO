//
//  RunWalkProApp.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import SwiftUI

@main
struct RunWalkProApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView{
                
                NavigationView{
                    let timerVal = 0
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                NavigationView{
                    
                    let lat = 0.0
                    let lon = 0.0
                    let dist = 0.0
                    
                    WorkoutView(lastLat: lat, lastLon: lon, distance: dist)
                }
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workout")
                }
                
                NavigationView{
                    SettingsView()
                }
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                
            }
            
        }
    }
}
