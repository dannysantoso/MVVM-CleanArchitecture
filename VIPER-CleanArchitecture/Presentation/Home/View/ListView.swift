//
//  ListView.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    var game: GameDomain
    
    var body: some View {
        VStack {
            HStack {
                WebImage(url: URL(string: game.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    ListViewTextContainer(attribute: "Name :", data: game.name)
                    ListViewTextContainer(attribute: "Rating :", data: game.rating)
                    ListViewTextContainer(attribute: "Released :", data: game.released)
                }.padding()
            }
        }
    }
}
