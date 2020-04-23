//
//  LobbyFirestoreVM.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/24.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import Foundation
import Firebase


class LobbyFirestoreVM: ObservableObject {
    @Published var rooms = [Rooms]()
    
    let db: Firestore!
    
    init() {
        db = Firestore.firestore()
        //ロビーに表示するオンラインルーム一覧情報の自動更新を設定
        db.collection("rooms").order(by: "defaultRoom").addSnapshotListener{ snapshot, err in
            guard let snapshot = snapshot else {
                print("snapshotListener Error: \(String(describing: err))"); return
            }
            self.rooms = snapshot.documents.map { data -> Rooms in
                guard let roomName = data.data()["roomName"] else {
                    print("roomNameアンラップ失敗")
                    return Rooms(documentID: "nil", roomName: "nil", playerCount: 0)
                }
                return Rooms(documentID: data.documentID, roomName: roomName as! String, playerCount: data.data().count - 3)
            }
        }
        
    }
}

extension LobbyFirestoreVM {
    
}
