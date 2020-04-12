//
//  PlayGameFirestoreOnlinePage.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI
import QGrid

struct PlayGameFirestoreOnlinePage: View {
    
    @State private var inabaCards: [CardData] = [
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
        CardData(id: "1", imageName: "ina15", isOpened: true, isMatched: false),
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
    
    @State private var turnCount = 99
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    //カスタム戻るボタン
    @Environment(\.presentationMode) var presentationMode
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .imageScale(.large)
                Text("ロビーへ")
                    .accentColor(Color.black)
                    .font(.system(size: 16, weight: .semibold, design: .default))
            }
        }
        
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color(red: 44/255, green: 113/255, blue: 44/255)                        .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        VStack{
                            Rectangle()
                                .foregroundColor(Color.clear)
                                .frame(width: 0, height: 0)
                            Text("残り").font(.system(size: 30, weight: .medium, design: .default))
                        }
                        Text("\(self.turnCount)").font(.system(size: 50, weight: .bold, design: .default))
                        VStack{
                            Rectangle()
                                .foregroundColor(Color.clear)
                                .frame(width: 0, height: 0)
                            Text("ターン").font(.system(size: 30, weight: .medium, design: .default))
                        }
                    }.foregroundColor(.clear)
                    //CollectionView的なライブラリ
                    QGrid(inabaCards,
                          columns: 6,
                          vSpacing: 10,
                          hSpacing: 6,
                          vPadding: 0,
                          hPadding: 0) { cardData in
                            CardCell(inabaCards: self.$inabaCards, cardData: cardData, index: 0)}
                }
                .padding(.all, 18)
                .padding(.top, 40)
            }
            .navigationBarTitle("ルーム1(デフォ)", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton) //上で自作したカスタム戻るボタンを設置
            
        }
    }
}

struct PlayGameFirestoreOnlinePage_Previews: PreviewProvider {
    static var previews: some View {
        PlayGameFirestoreOnlinePage()
    }
}
