//
//  MainView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI

struct MainView: View {
    
    var email: String
    
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "list.dash")
                }
            
            SavedItemsView()
                .tabItem {
                    Label("My Items", systemImage: "list.dash")
                }
            
            
            ProfileView(email: email)
                .tabItem {
                    Label("Profile", systemImage: "list.dash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(email: "sadfaa")
    }
}
