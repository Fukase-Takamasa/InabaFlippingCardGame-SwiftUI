//
//  PlayGameFirestoreVM.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import Foundation
import Firebase

class PlayGameFirestoreVM: ObservableObject {
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
                    return CardData(id: data.data()["id"] as! Int, imageName: data.data()["imageName"] as! String, isOpened: data.data()["isOpened"] as! Bool, isMatched: data.data()["isMatched"] as! Bool)
                }
            }
        })
    }
    
    
}
