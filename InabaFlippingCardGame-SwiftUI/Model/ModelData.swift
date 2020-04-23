//
//  CardData.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import Foundation

struct Rooms {
    var id: String
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

var sampleCardDatas: [CardData] = [
    CardData(id: "1", imageName: "ina1", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina2", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina3", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina4", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina5", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina6", isOpened: true, isMatched: false),
    CardData(id: "1", imageName: "ina7", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina8", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina9", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina10", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina11", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina12", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina13", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina14", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina15", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina1", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina2", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina3", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina4", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina5", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina6", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina7", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina8", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina9", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina10", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina11", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina12", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina13", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina14", isOpened: false, isMatched: false),
    CardData(id: "1", imageName: "ina15", isOpened: false, isMatched: false),
]
