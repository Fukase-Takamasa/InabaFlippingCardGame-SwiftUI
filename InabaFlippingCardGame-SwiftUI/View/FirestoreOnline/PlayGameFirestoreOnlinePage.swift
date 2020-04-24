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
    
    @ObservedObject var playGameFirestoreVM = PlayGameFirestoreVM()
        
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
            Color(red: 44/255, green: 113/255, blue: 44/255)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 0){
                VStack(spacing: 0) {
                    Color.clear
                }.frame(height: geometry.size.height * 0.2)
                
                //CollectionView的なライブラリ
                QGrid(self.playGameFirestoreVM.inabaCards,
                      columns: 6,
                      vSpacing: geometry.size.height * 0.012,
                      hSpacing: geometry.size.width * 0.02,
                      vPadding: 0,
                      hPadding: 0) { cardData in
                    OnlineCardCell(cardData: cardData)
                }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7, alignment: .center)
                
                VStack(spacing: 0) {
                    Color.clear
                }.frame(height: geometry.size.height * 0.1) //スペーサー
            } //UIパーツを置いている画面全体に広がるエリア
        }
        .navigationBarTitle("ルーム1(デフォ)", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: self.backButton) //上で自作したカスタム戻るボタンを設置
            
        }
    }
}

struct PlayGameFirestoreOnlinePage_Previews: PreviewProvider {
    static var previews: some View {
        PlayGameFirestoreOnlinePage()
    }
}
