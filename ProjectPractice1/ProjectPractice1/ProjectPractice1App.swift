//
//  ProjectPractice1App.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/20/22.
//

import SwiftUI
import Firebase

@main
struct ProjectPractice1App: App {
    @StateObject var dataManager = DataManager()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
