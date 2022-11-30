//
//  MainView.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/21/22.
//

import Foundation
import SwiftUI

struct MainView: View {
    @EnvironmentObject var dataManager: DataManager
    @State var tempItemName: String = ""
    @State var tempQuantity: String = ""
    
    @State var list :[FoodItem] = []
    
    func fetchThreeItems() {
        list.removeAll()
        for _ in 0...2 {
            let rand = Int.random(in: 0..<dataManager.entries.count)
            list.append(dataManager.entries[rand])
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(0xF56A4D))
                    .frame(width: 400, height: 250)
                
                Text("Discover")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .offset(x: 0, y: 100)
            }
            if (list.count == 3) {
                CustomCell(itemName: list[0].itemName, restaurantName: list[0].restaurantName, image: "BurgerIcon")
                CustomCell(itemName: list[1].itemName, restaurantName: list[1].restaurantName, image: "BurgerIcon")
                CustomCell(itemName: list[2].itemName, restaurantName: list[2].restaurantName, image: "BurgerIcon")
            } else {
                CustomCell(itemName: "", restaurantName: "", image: "GrayImage")
                CustomCell(itemName: "", restaurantName: "", image: "GrayImage")
                CustomCell(itemName: "", restaurantName: "", image: "GrayImage")
            }
            
            Button ("Randomize") {
                fetchThreeItems()
            }
        }
        .offset(x:0, y: -150)
        
    }
}
