//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var sliderVal: Double = 50
    @State var on = false
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20)
                    
                Spacer()
                        
                VStack() {
                    Text("Current Level")
                    Text("1")
                }
                .padding(.trailing, 20)
            }
            .padding(.top, 20)
                    
            Spacer()
            
            Text("Move slider to:")
            Text("25")
            Slider(value: $sliderVal, in: 0...100)
            Button("Check") {
                
            }
            
            Text("Exact Mode")
            Toggle(
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
