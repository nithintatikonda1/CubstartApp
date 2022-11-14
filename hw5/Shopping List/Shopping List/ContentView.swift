//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class fruit {
    let name:String
    let color: String
    
    init(fruitName: String, fruitColor: String) {
        self.name = fruitName
        self.color = fruitColor
    }
}

class Item: Identifiable {
    let imageName: String
    let itemName: String
    let quantity: String
    
    init(imageName: String, itemName: String, quantity: String) {
        self.itemName = itemName
        self.imageName = imageName
        self.quantity = quantity
    }
}

struct ContentView: View {
    var list = [Item(imageName: "banana", itemName: "banana", quantity: "1"), Item(imageName: "apple", itemName: "apple", quantity: "1")]
    
    var body: some View {
        List(list) { i in
            CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
        }
    }
}
