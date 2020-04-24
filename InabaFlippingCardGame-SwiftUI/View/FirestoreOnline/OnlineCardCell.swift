//
//  OnlineCardCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct OnlineCardCell: View {
    
    var cardData: CardData
//    var index = 0
    
    var body: some View {
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
                
        }
    }
}

//    private func returnImage(cardData: CardData, index: Int) -> Image {
//        if cardData.isMatched || cardData.isOpened {
//            return Image(cardData.imageName)
//        }else {
//            if index % 2 == 0 {
//                return Image("CardBackImageRed")
//            }else {
//                return Image("CardBackImageBlue")
//            }
//        }
//    }

//struct OnlineCardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        OnlineCardCell()
//    }
//}
