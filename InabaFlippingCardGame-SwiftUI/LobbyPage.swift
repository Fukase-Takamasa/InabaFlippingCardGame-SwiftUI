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
                Color(red: 44/255, green: 113/255, blue: 44/255)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    HStack{
                        Rectangle()
                            .foregroundColor(Color.green)
                            .frame(width: 170, height: 0)
                        VStack{
                            HStack{
                                Rectangle()
                                .foregroundColor(Color.clear)
                                .frame(width: 0, height: 0)
                                //ZStackでTextを重ねてカスタム色のプレースホルダーを自作
                                ZStack(alignment: .leading){
                                    if playerName.isEmpty {
                                        
                                        Text("ニックネーム未設定")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .light, design: .default))
                                        
                                    }
                                    TextField("", text: $playerName)
                                        .accentColor(.orange)
                                        .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular, design: .default))
                                }
                                Rectangle()
                                .foregroundColor(Color.clear)
                                .frame(width: 0, height: 0)
                            }
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(height: 1)
                        }
                    }
                    Text("ひとりで遊ぶ")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .black, design: .default))
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
                    .opacity(0.9)
                        
                    Text("オンラインで遊ぶ")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .black, design: .default))
                        .frame(width: 320, height: 30, alignment: .leading)
                        
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 2.5)
                    
//                    List() { item in
                        
//                    }
                    Spacer();Spacer();Spacer();Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 20)

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
