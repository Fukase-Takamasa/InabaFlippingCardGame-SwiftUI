//
//  CardData.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import Foundation

struct Rooms {
    var documentID: String
    var roomName: String
    var playerCount: Int
}

struct CardData: Identifiable {
    var id: String
    var imageName: String
    var isOpened: Bool
    var isMatched: Bool
}
