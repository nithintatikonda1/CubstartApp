//
//  FinalAppApp.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import SwiftUI
import Firebase

@main
struct FinalAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
