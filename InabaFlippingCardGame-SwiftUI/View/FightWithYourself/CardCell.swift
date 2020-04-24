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
    @Binding var turnCount: Int
    @Binding var flipCount: Int
    @Binding var flippedCard: [Int]
    
    var cardData: CardData
    
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
                self.tapCard()
        }
    }

    private func tapCard() {
        if inabaCards[self.cardData.id].isOpened == false {
            self.inabaCards[self.cardData.id].isOpened = true
            //フリップ1回目　カードをめくり、カウントを＋1と　めくったカードのindexを記録
            if self.flipCount == 1 {
                self.flipCount += 1
                self.flippedCard[0] = self.cardData.id
            }else {
                turnCount -= 1
                //フリップ２回目　２枚がマッチしてるかジャッジ
                self.flippedCard[1] = self.cardData.id
                if (inabaCards[flippedCard[0]].imageName) == (inabaCards[flippedCard[1]].imageName) {
                    print("マッチした！")
                    print("マッチ結果: \(inabaCards[flippedCard[0]]), \(inabaCards[flippedCard[1]])")
                    print("flippedCard: \(flippedCard)")
                    //マッチした！両方のカードのisMatchedをtrueにする
                    inabaCards[flippedCard[0]].isMatched = true
                    inabaCards[flippedCard[1]].isMatched = true
                    self.flipCount = 1
                    self.flippedCard = [0,0]
                }else {
                    print("マッチしませんでした")
                    print("マッチ結果: \(inabaCards[flippedCard[1]]), \(inabaCards[flippedCard[1]])")
                    print("flippedCard: \(flippedCard)")
//                    collectionView.isUserInteractionEnabled = false
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                        //マッチしてないので、両方閉じる
                        self.inabaCards[self.flippedCard[0]].isOpened = false
                        self.inabaCards[self.flippedCard[1]].isOpened = false
                        self.flipCount = 1
                        self.flippedCard = [0,0]
//                        collectionView.isUserInteractionEnabled = true
                    }
                }
                //クリアしたか、それとも0ターンになってしまったかどうかチェックし、それぞれアラートを表示
//                checkClearOrFailed()
            }
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
