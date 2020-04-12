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
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 255/255, green: 192/255, blue: 0/255)
                    .edgesIgnoringSafeArea(.all)
                QGrid(sampleCardDatas,
                  columns: 6,
                  vSpacing: 0,
                  hSpacing: 0,
                  vPadding: 0,
                  hPadding: 0) { cardData in
                CardCell(cardData: cardData)}
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
