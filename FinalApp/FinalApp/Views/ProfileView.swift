//
//  ProfileView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    var email: String
    
    var body: some View {
        ZStack {
            BackgroundMain()
            
            VStack {
                HeaderText(str: "Profile")
                
                ZStack {
                    Circle()
                        .frame(width: 160, height: 160)
                        .padding(.bottom)
                        .foregroundColor(.gray)
                    
                    Image("account")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                }
                
                Text(email)
                    .padding(.bottom, 150)
                
                Image("UCBerkeleyCampus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 100)
            }
            .offset(x: 0, y: -100)
            
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(email: "some email")
    }
}
