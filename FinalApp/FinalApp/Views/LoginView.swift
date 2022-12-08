//
//  LoginView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var authenticated: Bool = false
    @State var message: String = ""
    var lst: [String] = []
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err == nil {
                EntryRetriever.fetchItems()
                guard let uid = Auth.auth().currentUser?.uid else {
                    print("Failed to get userID")
                    return
                }
                let db = Firestore.firestore()
                let ref = db.collection("SavedItems").document(uid)

                ref.getDocument { (document, error) in
                    if let document = document, document.exists {
                        authenticated = true
                    } else {
                        ref.setData(["lst": []]) { err in
                            if err != nil {
                                    print("Error creating doc")
                                } else {
                                    authenticated = true
                                }
                            }
                    }
                }
            }
            else {
                message = "Failed to login"
            }
            
        }
    }
    
    
    var body: some View {
        if (authenticated) {
            MainView(email: email)
        }
        else {
            NavigationView {
                ZStack {
                    BackgroundMain()
                    
                    VStack {
                        HeaderText(str: "Login")
                            .padding(.bottom, 50)
                        
                        Text("Email")
                            .padding(.trailing, 300)
                            .foregroundColor(Color(0xF56A4D))
                        
                        TextField("email", text: $email)
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
                        
                        Text(message)
                            .foregroundColor(.red)
                        
                    }
                    .offset(x: 0, y: -100)
                    
                }
            }
            .accentColor(.blue)
        }
    }
}

/*https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui */
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
