//
//  SignUpView.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/20/22.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    func signup() {
        
    }
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(0xF56A4D))
                .frame(width: 400, height: 250)
                .offset(x: 0, y: -340)
            
            VStack {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .padding(70)
                
                Text("First Name")
                    .padding(.trailing, 270)
                    .foregroundColor(Color(0xF56A4D))
                
                TextField("first name", text: $firstName)
                    .padding(10)
                    .frame(width: 350, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                
                Text("Last Name")
                    .padding(.trailing, 270)
                    .foregroundColor(Color(0xF56A4D))
                
                TextField("last name", text: $lastName)
                    .padding(10)
                    .frame(width: 350, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                
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
                    .padding(.bottom, 40)
                
                Button(action: signup) {
                    Text("Sign Up")
                        .padding()
                        .background(Color(0xF56A4D))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                
            }
            .offset(x: 0, y: -80)
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

