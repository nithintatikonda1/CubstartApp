//
//  SignUpView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var message: String = ""
    @State var confirm: String = ""
    @State private var alert = false
    
    func signup() {
        if (password != confirm) {
            alert = true;
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            if err == nil {
                message = "Successfully Signed Up"
                //let db = Firestore.firestore()
                //let ref = db.collection("SavedItems").document("Users").collection
            }
            else {
                message = "Failed to Sign Up"
            }
        }
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
                
                Text("Email")
                    .padding(.trailing, 300)
                    .foregroundColor(Color(0xF56A4D))
                
                TextField("email", text: $email)
                    .padding(10)
                    .frame(width: 350, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                Group {
                    Text("Password")
                        .padding(.trailing, 270)
                        .foregroundColor(Color(0xF56A4D))
                    
                    SecureField("password", text: $password)
                        .padding(10)
                        .frame(width: 350, height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                    
                    Text("Confirm Password")
                        .padding(.trailing, 210)
                        .foregroundColor(Color(0xF56A4D))
                    
                    SecureField("Confirm Password", text: $confirm)
                        .padding(10)
                        .frame(width: 350, height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                        .padding(.bottom, 40)
                    
                }
                Group {
                    Button(action: signup) {
                        Text("Sign Up")
                            .padding()
                            .background(Color(0xF56A4D))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    
                    Text(message)
                }
            }
            .offset(x: 0, y: -20)
        }
        .alert("Password do not match", isPresented: $alert){
            Button("Try Again"){}
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
