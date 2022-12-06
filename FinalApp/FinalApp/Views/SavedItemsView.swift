//
//  SavedItemsView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI
import Firebase

struct SavedItemsView: View {
    
    @State var savedItems: [String] = []
    @State var refresh: Bool = true
    
    func retrieveSavedItems() {
        if (refresh && EntryRetriever.entries.count >= 3) {
            savedItems.removeAll()
            guard let uid = Auth.auth().currentUser?.uid else {
                print("Failed to get userID")
                return
            }
            print(uid)
            
            let db = Firestore.firestore()
            db.collection("SavedItems").document(uid).getDocument { (doc, err) in
                guard err == nil else {
                            print("error")
                            return
                }

                if let doc = doc, doc.exists {
                    let data = doc.data()
                    if let data = data {
                        savedItems = data["lst"] as! [String]
                    }
                }
            }
        }
    }
    
    func refreshView() {
        savedItems.removeAll()
        refresh = true
    }
    
    var body: some View {
        ZStack {
            BackgroundMain()
            
            VStack {
                HeaderText(str: "Saved Items")
                List(savedItems, id: \.self) { str in
                            Text(str)
                        }
            }
            .offset(x:0, y: 100)
        }
        .onAppear {
            retrieveSavedItems()
        }
    }
}

struct SavedItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedItemsView()
    }
}
