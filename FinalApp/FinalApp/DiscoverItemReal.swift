//
//  DiscoverItemReal.swift
//  FinalApp
//
//  Created by Nithin Tatikonda on 12/1/22.
//

import SwiftUI
import Firebase


struct DiscoverItemReal: View {
    
    var itemName: String
    var restName: String
    var image: UIImage
    @State var saved: Bool = false
    @State var arr: [String] = []
    
    func saveItem() {
        saved = true
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Failed to get userID")
            return
        }
        print(uid)
        
        let db = Firestore.firestore()
        let ref = db.collection("SavedItems").document(uid)
        ref.getDocument { (doc, err) in
            guard err == nil else {
                        print("error")
                        return
            }

            if let doc = doc, doc.exists {
                let data = doc.data()
                if let data = data {
                    arr = data["lst"] as! [String]
                    arr.append(itemName + " from " + restName)
                    ref.setData(["lst": arr]) { err in
                        if err != nil {
                                print("Error updating array")
                            }
                        }
                    
                    
                }
            }
        }
    }
    
    var body: some View {
            HStack {
                Image(uiImage: image)
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
                        if (saved) {
                            Image("bookmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                        else {
                            Image("bookmark-white")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
                .padding(.trailing, 15)
            }
            .padding(.bottom, 15)
            
    }
}

struct DiscoverItemReal_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverItemReal(itemName: "", restName: "", image: UIImage())
    }
}


