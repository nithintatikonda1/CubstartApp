//
//  DiscoverItem.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import SwiftUI

struct DiscoverItem: View {
    
    var itemName: String
    var restName: String
    var image: String
    
    func saveItem() {
        
    }
    
    var body: some View {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 4))
                    .padding(.leading, 15)
                
                Spacer()
                
                VStack {
                    Text(itemName)
                    
                    Text(restName)
                }
                
                Spacer()
                
                Button(action: saveItem) {
                    Label {
                    } icon: {
                        Image("bookmark-white")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(.trailing, 15)
            }
            .padding(.bottom, 15)
            
    }
}

struct DiscoverItem_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverItem(itemName: "pepperoni pizza", restName: "Blaze Pizza", image: "pizza")
    }
}
