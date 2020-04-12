//
//  CardCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct CardCell: View {
    
    @Binding var inabaCards: [CardData]
    var cardData: CardData
    var index = 0
    
    var body: some View {
        returnImage(cardData: cardData, index: index)
            .resizable()
            .scaledToFit()
            
            
            .onTapGesture {
                self.inabaCards[0].isOpened.toggle()
                
        }
    }
}

private func returnImage(cardData: CardData, index: Int) -> Image {
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

//struct CardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        List(0..<(sampleCardDatas.count)) { item in
//            CardCell(cardData: sampleCardDatas[item])
//        }
//    }
//}
