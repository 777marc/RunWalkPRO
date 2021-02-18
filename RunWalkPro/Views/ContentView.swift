//
//  ContentView.swift
//  RunWalkPro
//
//  Created by Marc Mendoza on 2/17/21.
//

import SwiftUI

struct ContentView: View {
    
        
    var body: some View {
        
        VStack{
            Text("Home View")
            Button(action: {
                print("button click")
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    Text("Share")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                
            }
                .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .navigationTitle("Home")
    }
}
