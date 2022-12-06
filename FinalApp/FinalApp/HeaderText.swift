//
//  HeaderText.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI

struct HeaderText: View {
    
    var str: String
    
    var body: some View {
        Text(str)
            .foregroundColor(.white)
            .font(.system(size: 40, weight: .bold, design: .serif))
    }
}
