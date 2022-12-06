//
//  BackgroundMain.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI

struct BackgroundMain: View {
    
    var body: some View {
        Image("Background1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}
