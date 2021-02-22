//
//  DetailView.swift
//  VIPERCleanArchitecture
//
//  Created by danny santoso on 23/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 250, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .padding(.bottom, 100)
                GameTextContent(title: "Name :")
                GameTextContent(title: "Rating :")
                GameTextContent(title: "Released :")
                Spacer()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct GameTextContent: View {
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding(.leading, 50)
                    .font(.system(size: 16, weight: .heavy, design: .default))
                Spacer()
                Text("Hello")
                    .padding(.trailing, 50)
            }.padding(.bottom, 20)
        }
    }
}
