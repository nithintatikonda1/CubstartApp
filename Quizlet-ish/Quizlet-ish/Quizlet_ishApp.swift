//
//  Quizlet_ishApp.swift
//  Quizlet-ish
//
//  Created by Nithin Tatikonda on 11/13/22.
//

import SwiftUI
import Firebase

@main
struct Quizlet_ishApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

