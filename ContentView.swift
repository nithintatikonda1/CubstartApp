//
//  ContentView.swift
//  Meal-Project
//
//  Created by Hongjie Zhou on 11/29/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @State private var userName = ""
    @State private var password = ""
    @State var showView = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Text("Log In")
                        .font(.title3)
                        .foregroundColor(Color.orange)
                        .bold()
                        .padding()
                    TextField("Username", text: $userName)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(25)
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(25)
                    Button {
                        login()
                    } label : {
                        Log()
                    }
                    Button(action: {
                        self.showView = true
                    }) {
                        CreateAccountButton()
                    }
                    NavigationLink(destination: New(), isActive: $showView) {
                    EmptyView()
                    }
                }
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: self.userName, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
        }
        }
    }
    
    
    struct CreateAccountButton: View {
        var body: some View {
            Text("Create Account")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 10)
                .padding()
                .background(.orange)
                .cornerRadius(50)
        }
    }
    
    struct Log: View {
        var body: some View {
            Text("Sign In")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 150, height: 10)
                .padding()
                .background(.orange)
                .cornerRadius(50)
        }
    }
    
    struct New: View {
        @State private var SignIn = ""
        @State private var Pass = ""
        var body: some View {
            ZStack {
                VStack{
                    Text("Sign Up")
                        .font(.title3)
                        .foregroundColor(Color.orange)
                        .bold()
                        .padding()
                    TextField("Username", text: $SignIn)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(25)
                    TextField("Password", text: $Pass)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(25)
                    Button {
                        register()
                    } label: {
                        CreateAccountButton()
                    }
                }
            }
        }
        
        func register(){
            Auth.auth().createUser(withEmail: self.SignIn, password: self.Pass){
                result, error in if error != nil {
                    print(error!.localizedDescription)
                }
            }
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }
}
