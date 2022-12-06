//
//  ContentView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import SwiftUI

struct ContentView: View {
    @State var tapped: Bool = false
    var body: some View {
        if tapped {
            LoginView()
        }
        else {
            ZStack {
                Color(0xF56A4D)
                    
                Image("MealMeIcon")
                    .resizable()
                    .frame(width: 160, height: 160, alignment: .center)
                
                Text("Meal Me")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .offset(x: 0, y: 300)
                        
                
                NavigationLink(destination: LoginView()) {
                    Rectangle()
                        .opacity(0)
                }
            }
            .ignoresSafeArea()
            .onTapGesture {
                tapped = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
