//
//  ContentView.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            ZStack {
                Color(0xF56A4D)
                
                Image("BurgerIcon")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

