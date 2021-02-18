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
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                NavigationView{
                    WorkoutView()
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
