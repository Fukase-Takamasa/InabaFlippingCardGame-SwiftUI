//
//  LobbyPage.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/11.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct LobbyPage: View {
    
    //@State private var navigationLinkIsActive = false
    //↑コードで遷移にしたいときはNavigationLinkの引数isActiveに↑のBoolを設定し、
    //ButtonActionの中などでself.navigationLinkIsActiveをtrueにしてトリガーにする
    
    @ObservedObject var lobbyFirestoreVM = LobbyFirestoreVM()
    
    @State private var playerName = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
        GeometryReader { geometry in
        ZStack {
            Color(red: 44/255, green: 113/255, blue: 44/255)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 12){

                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 0){
                        Spacer()
                        VStack(alignment: .center, spacing: 0){
                            HStack(alignment: .center, spacing: 0){
                                //ZStackでTextを重ねてカスタム色のプレースホルダーを自作
                                ZStack(alignment: .leading){
                                    if self.playerName.isEmpty {
                                        Text("ニックネーム未設定")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular, design: .default))
                                            .opacity(0.6)
                                    }
                                    TextField("", text: self.$playerName)
                                        .accentColor(.orange)
                                        .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .light, design: .default))
                                }.frame(width: 136)
                            }
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(height: 1)
                        }.frame(width: 145)
                    }
                    Text("ひとりで遊ぶ")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .medium, design: .default))
                        .frame(height: 25, alignment: .leading)
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 2)
                }
                HStack{
                    NavigationLink(destination: PlayGameFightWithYourSelfPage()) {
                        HStack(alignment: .center){
                            Spacer()
                            HStack(spacing: 4) {
                                Image(systemName: "person")
                                    .imageScale(.large)
                                Text("自分との戦い")
                                    .font(.system(size: 21, weight: .semibold, design: .default))
                            }
                            .frame(width: 255, height: 52, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            .accentColor(Color.black)
                            .opacity(0.9)
                            Spacer()
                        }
                    }
                }
                HStack{
                    NavigationLink(destination: PlayGameFightWithYourSelfPage()) {
                        HStack(alignment: .center){
                            Spacer()
                            HStack(spacing: 4){
                                Image(systemName: "desktopcomputer")
                                    .imageScale(.medium)
                                Text("コンピュータと対戦")
                                    .font(.system(size: 21, weight: .semibold, design: .default))
                            }
                            .frame(width: 255, height: 52, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                            .accentColor(Color.black)
                            .opacity(0.9)
                            Spacer()
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("オンラインで遊ぶ")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .medium, design: .default))
                        .frame(height: 25, alignment: .leading)
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 2)
                }
                List(self.lobbyFirestoreVM.rooms, id: \.id) { room in
//                    Section(header: Text("新しいルームを作る")
//                        .font(.system(size: 16, weight: .semibold, design: .default))
//                        .foregroundColor(Color.black)
//                    ) {
//                        Text(" ＋ 今すぐ作成")
//                    }
//                    Section(header: Text("だれかのゲームに参加する")
//                        .font(.system(size: 16, weight: .semibold, design: .default))
//                    .foregroundColor(Color.black)) {
//                        //セルをreturnする
//                        RoomListCell(room: room)
//                    }
                    
                    RoomListCell(room: room)

                    
                }.cornerRadius(15)
                .listStyle(PlainListStyle())
                    .padding(.horizontal, 9)
//                        .environment(\.horizontalSizeClass, .regular)
                
            }
            .padding(.top, 10)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 30)

            .navigationBarTitle("ロビー«SwiftUI»", displayMode: .inline)
        }//Zstack
        }//GeometryReader
        }// Navi
    }
    
    private func goToGamePage() {
        
    }
}

struct LobbyPage_Previews: PreviewProvider {
    static var previews: some View {
        LobbyPage()
    }
}
