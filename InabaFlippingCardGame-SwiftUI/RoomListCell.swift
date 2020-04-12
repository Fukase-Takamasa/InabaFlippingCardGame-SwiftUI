//
//  RoomListCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct RoomListCell: View {
    
var roomList = ["ルーム1(デフォ)", "ルーム2(デフォ)", "ルーム3(デフォ)"]
    
    var body: some View {
        HStack {
            NavigationLink(destination: PlayGameFirestoreOnlinePage()) {
                Text(roomList[0])
                Spacer()
            }
        }
    }
}

struct RoomListCell_Previews: PreviewProvider {
    static var previews: some View {
        RoomListCell()
    }
}
