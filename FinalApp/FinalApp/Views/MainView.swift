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
                    //Label("Discover", image: "burger")
                    Label("Discover", systemImage: "magnifyingglass")
                }
            
            SavedItemsView()
                .tabItem {
                    Label("My Items", systemImage: "bookmark")
                }
            
            
            ProfileView(email: email)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(email: "sadfaa")
    }
}
