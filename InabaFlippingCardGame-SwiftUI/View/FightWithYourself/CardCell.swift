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
//    var index = 0
    
    var body: some View {
//        returnImage(cardData: cardData, index: index)
        
        ZStack(){
            Color(.white)
            if cardData.isMatched || cardData.isOpened {
                Image(cardData.imageName)
                    .resizable()
                    .scaledToFit()
            }else {
                if cardData.id % 2 == 0 {
                    Image("CardBackImageRed")
                        .resizable()
                        .scaledToFill()
                }else {
                    Image("CardBackImageBlue")
                        .resizable()
                        .scaledToFill()
                }
            }
        }.cornerRadius(6)
            .onTapGesture {
                self.inabaCards[self.cardData.id].isOpened.toggle()
        }
    }
}

//private func returnImage(cardData: CardData, index: Int) -> Image {
//    if cardData.isMatched || cardData.isOpened {
//        return Image(cardData.imageName)
//    }else {
//        if index % 2 == 0 {
//            return Image("CardBackImageRed")
//        }else {
//            return Image("CardBackImageBlue")
//        }
//    }
//}

//struct CardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        List(0..<(sampleCardDatas.count)) { item in
//            CardCell(cardData: sampleCardDatas[item])
//        }
//    }
//}
