//
//  RoomListCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct RoomListCell: View {
    
//var roomList = ["ルーム1(デフォ)", "ルーム2(デフォ)", "ルーム3(デフォ)"]
    var room: Rooms
    
    var body: some View {
        HStack(spacing: 0) {
            NavigationLink(destination: PlayGameFirestoreOnlinePage()) {
                Text(room.roomName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(room.playerCount)/2人 ")
                if room.playerCount < 2 {
                    Text("参加する").frame(width: 90)
                        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 90/255, green: 200/255, blue: 250/255))
                        .frame(width: 90, height: 32))
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .default))
                }else {
                    Text("満室").frame(width: 90)
                        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 255/255, green: 149/255, blue: 0/255))
                        .frame(width: 90, height: 32))
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium, design: .default))
                }
            }
        }.frame(height: 40)
    }
}

struct RoomListCell_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRoom = Rooms(id: "", documentID: "", roomName: "サンプル部屋", playerCount: 2)
        return RoomListCell(room: sampleRoom)
    }
}
