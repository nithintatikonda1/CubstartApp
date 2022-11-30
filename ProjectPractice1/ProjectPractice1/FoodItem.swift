//
//  FoodItem.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/28/22.
//

import Foundation

class FoodItem: Identifiable {
    var itemName: String
    var restaurantName: String
    
    init(itemName: String, restaurantName: String) {
        self.itemName = itemName
        self.restaurantName = restaurantName
    }
}
