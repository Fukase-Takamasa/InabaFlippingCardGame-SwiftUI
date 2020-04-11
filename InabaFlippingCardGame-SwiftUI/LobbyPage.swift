//
//  LobbyPage.swift
//  InabaFlippingCardGame-SwiftUI
//
//  Created by 深瀬 貴将 on 2020/04/11.
//  Copyright © 2020 深瀬 貴将. All rights reserved.
//

import SwiftUI

struct LobbyPage: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarTitle("ロビー«SwiftUI»", displayMode: .inline)
            }
        }
    }
}

struct LobbyPage_Previews: PreviewProvider {
    static var previews: some View {
        LobbyPage()
    }
}
