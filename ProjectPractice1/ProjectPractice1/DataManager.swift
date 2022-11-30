//
//  DataManager.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/28/22.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    var entries: [FoodItem] = []
    @Published var threeEntries: [FoodItem] = []
    
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        entries.removeAll()
        let db = Firestore.firestore()
        db.collection("FoodItems").getDocuments { (snapshot, err) in
            if err == nil {
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        self.entries.append(FoodItem(itemName: document.get("itemName") as! String, restaurantName: document.get("restaurantName") as! String))
                        

                    }
                }
            } else {
                print("failed to retrieve items")
            }
            
        }
    }
    
    
}
