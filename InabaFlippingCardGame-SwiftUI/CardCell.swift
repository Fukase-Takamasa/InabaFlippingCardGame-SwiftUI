//
//  CardCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct CardCell: View {
    
//    let superView = PlayGameFightWithYourSelfPage()
    @Binding var inabaCards: [CardData]
    var cardData: CardData
    var index = 0
//    var isOpened = false
//    var isMatched = false
    
    var body: some View {
        returnImage(cardData: cardData, index: index)
            .resizable()
            .scaledToFit()
            
            
            .onTapGesture {
                self.inabaCards[0].isOpened.toggle()
//                sampleCardDatas[self.index].isOpened = true
                
        }
    }
}

func returnImage(cardData: CardData, index: Int) -> Image {
    if cardData.isMatched || cardData.isOpened {
        return Image(cardData.imageName)
    }else {
        if index % 2 == 0 {
            return Image("CardBackImageRed")
        }else {
            return Image("CardBackImageBlue")
        }
    }
}

func tappedCard(index: Int) {
    
}

//struct CardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        List(0..<(sampleCardDatas.count)) { item in
//            CardCell(cardData: sampleCardDatas[item])
//        }
//    }
//}
