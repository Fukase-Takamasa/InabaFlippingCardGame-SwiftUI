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
                Rectangle().frame(width: 40, height: 0)
                Text("参加する").background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 90/255, green: 200/255, blue: 250/255))
                    .frame(width: 90, height: 32))
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium, design: .default))
            }
        }
    }
}

struct RoomListCell_Previews: PreviewProvider {
    static var previews: some View {
        RoomListCell()
    }
}
