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
            
            Button(action: {
                print("action")
    
            }) {
                HStack {
                    Image(systemName: "plus.square.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("New Workout")
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )

            Button(action: {
                print("button click")
            }) {
                HStack {
                    Image(systemName: "eye")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("Previous Workout")
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )
           
            
        }
        .navigationTitle("Home")
        .padding()
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .navigationTitle("Home")
    }
}
