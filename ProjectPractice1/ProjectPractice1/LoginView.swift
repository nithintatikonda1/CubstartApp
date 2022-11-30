//
//  LoginView.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/20/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    func login() {
        
    }
    
    
    var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(0xF56A4D))
                    .frame(width: 400, height: 250)
                    .offset(x: 0, y: -340)
                
                VStack {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .padding(70)
                    
                    Text("Username")
                        .padding(.trailing, 270)
                        .foregroundColor(Color(0xF56A4D))
                    
                    TextField("username", text: $username)
                        .padding(10)
                        .frame(width: 350, height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                    
                    Text("Password")
                        .padding(.trailing, 270)
                        .foregroundColor(Color(0xF56A4D))
                    
                    SecureField("password", text: $password)
                        .padding(10)
                        .frame(width: 350, height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                        .padding(.bottom,40)
                    
                    
                    Button(action: login) {
                        Text("Sign In")
                            .padding()
                            .background(Color(0xF56A4D))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Don't have an account? Sign up")
                    }
                    
                    NavigationLink(destination: MainView()) {
                        Text("Skip Logiin")
                    }
                
            }
            .offset(x: 0, y: -130)
        }
        
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

