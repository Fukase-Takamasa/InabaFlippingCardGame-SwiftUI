//
//  OnlineCardCell.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct OnlineCardCell: View {
    
    @ObservedObject var playGameFirestoreVM = PlayGameFirestoreVM()
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
                if (self.cardData.id - 1) % 2 == 0 {
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
        if self.playGameFirestoreVM.inabaCards[self.cardData.id - 1].isOpened == false {
                if flipCount == 1 {
                    print("flipCount: \(self.flipCount)")
                    flipCount += 1
                    flippedCard[0] = self.cardData.id - 1
                    self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").collection("cardData").document("cardData\(flippedCard[0] + 1)").setData([
                        "isOpened": true
                    ], merge: true) { err in
                        print("indexPath.row: \(self.flippedCard[0])のisOpenedをtrueにした")
                        if let err = err {
                            print("errです: \(err)")
                        }else {
                            print("setData Succesful")
                        }
                    }
                }else {
                    print("flipCount: \(self.flipCount)")
                    flippedCard[1] = self.cardData.id - 1
                    //フリップ２回目　２枚がマッチしてるかジャッジ
                    if (self.playGameFirestoreVM.inabaCards[flippedCard[0]].imageName) == (self.playGameFirestoreVM.inabaCards[flippedCard[1]].imageName) {
                        print("マッチした！")
//                        self.navigationMessageLabel.text = "マッチしました！！\n続けてあなたのターンです"
                        print("マッチ結果: \(self.playGameFirestoreVM.inabaCards[flippedCard[0]]), \(self.playGameFirestoreVM.inabaCards[flippedCard[1]])")
                        print("flippedCard: \(flippedCard)")
                        //マッチした！両方のカードのisOpened / isMatchedをtrueにする
                        self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").collection("cardData").document("cardData\(flippedCard[0] + 1)").setData([
                            "isOpened": true,
                            "isMatched": true,
//                            "correctedPlayer": "player\(myPlayerNumber)"
                        ], merge: true) { err in
                            print("indexPath.row: \(self.flippedCard[1])のisOpenedをtrue, isMatchedをtrueにした")
                            if let err = err {
                                print("errです: \(err)")
                            }else {
                                print("setData Succesful")
                            }
                        }
                        self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").collection("cardData").document("cardData\(flippedCard[1] + 1)").setData([
                            "isOpened": true,
                            "isMatched": true,
//                            "correctedPlayer": "player\(myPlayerNumber)"
                        ], merge: true) { err in
                            print("indexPath.row: \(self.flippedCard[1])のisOpenedをtrue, isMatchedをtrueにした")
                            if let err = err {
                                print("errです: \(err)")
                            }else {
                                print("setData Succesful")
                            }
                        }
                        self.flipCount = 1
                        self.flippedCard = [0,0]
                    }else {
                        print("マッチしませんでした\nカードを覚えておきましょう♪")
//                        self.navigationMessageLabel.text = "マッチしませんでした\nカードを覚えておきましょう♪"
                        print("マッチ結果: \(self.playGameFirestoreVM.inabaCards[flippedCard[1]]), \(self.playGameFirestoreVM.inabaCards[flippedCard[1]])")
                        print("flippedCard: \(flippedCard)")
//                        collectionView.isUserInteractionEnabled = false
                        //ここで一旦　isOpened: trueだけ送信する
                        print("ここで一旦　isOpened: trueだけ送信する")
                        self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").collection("cardData").document("cardData\(flippedCard[1] + 1)").setData([
                            "isOpened": true,
                        ], merge: true) { err in
                            print("indexPath.row: \(self.flippedCard[1])のisOpenedをtrue, isMatchedをtrueにした")
                            if let err = err {
                                print("errです: \(err)")
                            }else {
                                print("setData Succesful")
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                            print("遅延処理内のflippedCard: \(self.flippedCard)")
                            //マッチしてないので、2秒後に両方閉じる
                            self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").collection("cardData").document("cardData\(self.flippedCard[0] + 1)").setData([
                                "isOpened": false,
                            ], merge: true) { err in
                                print("indexPath.row: \(self.flippedCard[0])のisOpenedをtrue, isMatchedをtrueにした")
                                if let err = err {
                                    print("errです: \(err)")
                                }else {
                                    print("setData Succesful")
                                }
                            }
                            self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").collection("cardData").document("cardData\(self.flippedCard[1] + 1)").setData([
                                "isOpened": false,
                            ], merge: true) { err in
                                print("indexPath.row: \(self.flippedCard[1])のisOpenedをtrue, isMatchedをtrueにした")
                                if let err = err {
                                    print("errです: \(err)")
                                }else {
                                    print("setData Succesful")
                                }
                            }
                            self.flipCount = 1
                            self.flippedCard = [0,0]
//                            self.playGameFirestoreVM.db.collection("rooms").document("7153904E-F915-47B3-B9B8-25DFF479B60ERoom").setData([
//                                "currentFlippingPlayer": "player\(self.myPlayerNumber)" == "player1" ? "player2" : "player1"], merge: true)
//                            self.navigationMessageLabel.text = "相手のターンです"
//                            collectionView.isUserInteractionEnabled = false
                        }
                    }
                }
            }
        }
}

//struct OnlineCardCell_Previews: PreviewProvider {
//    static var previews: some View {
//        OnlineCardCell()
//    }
//}
