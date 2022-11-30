//
//  Custom Cell.swift
//  ProjectPractice1
//
//  Created by Nithin Tatikonda on 11/29/22.
//

import Foundation
import SwiftUI

struct CustomCell: View {
    
    var itemName: String
    
    var restaurantName: String
    
    var image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 80, height: 80)
            Text(itemName)
                .padding()
            
            Text(restaurantName)
        }
        
        Spacer()
    }
}
