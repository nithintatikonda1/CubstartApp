//
//  FoodItem.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation

class FoodItem: Identifiable {
    var itemName: String
    var restaurantName: String
    var url: String
    
    init(itemName: String, restaurantName: String, url: String) {
        self.itemName = itemName
        self.restaurantName = restaurantName
        self.url = url
    }
}
