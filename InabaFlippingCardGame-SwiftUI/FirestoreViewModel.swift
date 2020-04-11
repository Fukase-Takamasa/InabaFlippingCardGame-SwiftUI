//
//  FirestoreViewModel.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import Foundation
import Firebase

struct CardData: Identifiable {
    var id: String
    var imageName: String
    var isOpened: Bool
    var isMatched: Bool
}

class FirestoreViewModel: ObservableObject {
    @Published var inabaCards = [CardData]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("rooms")
            .document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom")
            .collection("cardData")
        .order(by: "id")
        .addSnapshotListener({ (snapshot, err) in
            print("snapshot流れた")
            if let snapshot = snapshot {
                self.inabaCards = snapshot.documents.map{ data -> CardData in
                    let data = data.data()
                    return CardData(id: "", imageName: data["imageName"] as! String, isOpened: data["isOpened"] as! Bool, isMatched: data["isMatched"] as! Bool)
                }
            }
        })
    }
    
    
}
