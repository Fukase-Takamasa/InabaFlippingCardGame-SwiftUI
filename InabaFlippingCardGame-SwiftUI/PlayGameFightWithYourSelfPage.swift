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
    
    @State private var turnCount = 99
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 255/255, green: 192/255, blue: 0/255)
                    .edgesIgnoringSafeArea(.all)
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
                    }
                    //CollectionView的なライブラリ
                    QGrid(sampleCardDatas,
                          columns: 6,
                          vSpacing: 0,
                          hSpacing: -5,
                          vPadding: 0,
                          hPadding: 0) { cardData in
                            CardCell(cardData: cardData)}
                }
                .padding(.all, 12)
                .padding(.top, 80)
            }
            .navigationBarTitle("自分との戦い部屋", displayMode: .inline)
        }
    }
}

struct PlayGameFightWithYourSelfPage_Previews: PreviewProvider {
    static var previews: some View {
        PlayGameFightWithYourSelfPage()
    }
}
