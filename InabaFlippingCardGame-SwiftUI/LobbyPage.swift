//
//  LobbyPage.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/11.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct LobbyPage: View {
    
    @State private var playerName = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                VStack{
//                    Rectangle()
//                        .foregroundColor(.green)
//                        .frame(height: 30)
                    TextField("ニックネーム",
                              text: $playerName
                    ).textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150, height: 35, alignment: .trailing)
                        .padding(.leading, 160)
                    Text("ひとりで遊ぶ")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .black, design: .default))
                        .frame(width: 320, height: 30, alignment: .leading)
                        
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 2.5)
                    Button(action: {
                        
                    }){
                        HStack{
                            Image(systemName: "person")
                            .foregroundColor(.black)
                            .imageScale(.large)
                                
                            Text("自分との戦い")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                        }.frame(width: 240, height: 45, alignment: .center)
                    }
                    .background(Color.white)
                    .accentColor(Color.black)
                        
                    Text("オンラインで遊ぶ")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .black, design: .default))
                        .frame(width: 320, height: 30, alignment: .leading)
                        
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 2.5)
                    Spacer();Spacer();Spacer();Spacer()
                    }
//                .padding(.top, 20)
                .padding(.all, 20)
                .navigationBarTitle("ロビー«SwiftUI»", displayMode: .inline)
            }
//            .edgesIgnoringSafeArea()
        }
    }
}

struct LobbyPage_Previews: PreviewProvider {
    static var previews: some View {
        LobbyPage()
    }
}
