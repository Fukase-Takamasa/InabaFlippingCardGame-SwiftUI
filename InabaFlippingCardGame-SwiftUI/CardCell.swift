//
//  CardCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct CardCell: View {
    
    var cardData: CardData
    
    var body: some View {
        VStack {
            Image(cardData.imageName)
                .resizable()
                .scaledToFit()
        }
    }
}

struct CardCell_Previews: PreviewProvider {
    static var previews: some View {
        List(0..<(sampleCardDatas.count)) { item in
            CardCell(cardData: sampleCardDatas[item])
        }
    }
}
