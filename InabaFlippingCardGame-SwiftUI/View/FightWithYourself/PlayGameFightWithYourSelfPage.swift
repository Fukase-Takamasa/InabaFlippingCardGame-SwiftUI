//
//  PlayGameFightWithYourSelfPage.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/12.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI
import QGrid

struct PlayGameFightWithYourSelfPage: View {
    
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
    
    @State private var turnCount = 50
    
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
        GeometryReader { geometry in
        ZStack {
            Color(red: 255/255, green: 192/255, blue: 0/255)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0){
                VStack(spacing: 0) {
                    Spacer()
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
                    }
                    Spacer()
                }.frame(height: geometry.size.height * 0.2)
                
                //CollectionView的なライブラリ
                QGrid(self.inabaCards,
                      columns: 6,
                      vSpacing: geometry.size.height * 0.012,
                      hSpacing: geometry.size.width * 0.02,
                      vPadding: 0,
                      hPadding: 0) { cardData in
                    CardCell(inabaCards: self.$inabaCards, cardData: cardData, index: 1)
                }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7, alignment: .center)
                
                VStack(spacing: 0) {
                    Color.clear
                }.frame(height: geometry.size.height * 0.1) //スペーサー
            } //UIパーツを置いている画面全体に広がるエリア
        }
        .navigationBarTitle("自分との戦い部屋", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: self.backButton) //上で自作したカスタム戻るボタンを設置
            
        }
        .onAppear(perform: shuffleCards)
    }
    
    func shuffleCards() {
        self.inabaCards.shuffle()
    }
}

struct PlayGameFightWithYourSelfPage_Previews: PreviewProvider {
    static var previews: some View {
        PlayGameFightWithYourSelfPage()
    }
}
