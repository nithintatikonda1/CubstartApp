//
//  DiscoverView.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 11/30/22.
//

import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseFirestore

struct DiscoverView: View {
    
    @State var val: String = " "
    @State var image1: UIImage?
    @State var image2: UIImage?
    @State var image3: UIImage?
    
    func randomize() {
        image1 = nil
        image2 = nil
        image3 = nil
        if (EntryRetriever.entries.count >= 3) {
            
            EntryRetriever.threeEntries.removeAll()
            for _ in 0...2 {
                let rand = Int.random(in: 0..<EntryRetriever.entries.count)
                EntryRetriever.threeEntries.append(EntryRetriever.entries[rand])
            }
            let storageRef = Storage.storage().reference()
            let fileRef = storageRef.child(EntryRetriever.threeEntries[0].url)
            fileRef.getData(maxSize: 2097152) { (data, err) in
                if err == nil && data != nil {
                    if let image = UIImage(data: data!) {
                        image1 = image
                    }
                }
            }
            
            let fileRef2 = storageRef.child(EntryRetriever.threeEntries[1].url)
            fileRef2.getData(maxSize: 2097152) { (data, err) in
                if err == nil && data != nil {
                    if let image = UIImage(data: data!) {
                        image2 = image
                    }
                }
            }
            
            let fileRef3 = storageRef.child(EntryRetriever.threeEntries[2].url)
            fileRef3.getData(maxSize: 2097152) { (data, err) in
                if err == nil && data != nil {
                    if let image = UIImage(data: data!) {
                        image3 = image
                    }
                }
            }
            
            if val == " "{
                val = "  "
            }
            else {
                val = " "
            }
        }
        else {
            print("retrieving entries")
        }
    }
    
    var body: some View {
        ZStack {
            BackgroundMain()
            
            VStack {
                HeaderText(str: "Discover")
                    .padding(.top, 130)
                    .padding(.bottom, 80)
                
                if EntryRetriever.threeEntries.count != 3 || (image1 == nil || image2 == nil || image3 == nil) {
                    DiscoverItem(itemName: "", restName: "", image: "gray_background")
                    DiscoverItem(itemName: "", restName: "", image: "gray_background")
                    DiscoverItem(itemName: "", restName: "", image: "gray_background")
                }
                else {
                    DiscoverItemReal(itemName: EntryRetriever.threeEntries[0].itemName, restName: EntryRetriever.threeEntries[0].restaurantName, image: image1!)
                    DiscoverItemReal(itemName: EntryRetriever.threeEntries[1].itemName, restName: EntryRetriever.threeEntries[1].restaurantName, image: image2!)
                    DiscoverItemReal(itemName: EntryRetriever.threeEntries[2].itemName, restName: EntryRetriever.threeEntries[2].restaurantName, image: image3!)
                }
                
                Button(action: randomize) {
                    Text("Randomize")
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .padding()
                        .background(Color(0xF56A4D))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.top, 30)
                
                Text(val)
                
                
                Spacer()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
