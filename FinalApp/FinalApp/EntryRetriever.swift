//
//  EntryRetriever.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import Firebase

class EntryRetriever: ObservableObject {
    static var entries: [FoodItem] = []
    static var threeEntries: [FoodItem] = []
    
    
    static func fetchItems() {
        entries.removeAll()
        let db = Firestore.firestore()
        db.collection("Entries").getDocuments { (snapshot, err) in
            if err == nil {
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        entries.append(FoodItem(itemName: document.get("itemName") as! String, restaurantName: document.get("restName") as! String, url: document.get("url") as! String))
                    }
                }
            } else {
                print("failed to retrieve items")
            }
            
        }
    }
    
    
}
