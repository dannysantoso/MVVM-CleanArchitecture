//
//  DetailView.swift
//  VIPERCleanArchitecture
//
//  Created by danny santoso on 23/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @ObservedObject var detailPresenter: DetailPresenter
    
    var body: some View {
        NavigationView {
            VStack {
                WebImage(url: URL(string: detailPresenter.gameDomain.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200, alignment: .center)
                    .cornerRadius(15)
                    .padding(.bottom, 100)
                GameTextContent(title: "Name :", content: detailPresenter.gameDomain.name)
                GameTextContent(title: "Rating :", content: detailPresenter.gameDomain.rating)
                GameTextContent(title: "Released :", content: detailPresenter.gameDomain.name)
                Spacer()
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(detailPresenter: <#DetailPresenter#>)
//    }
//}

struct GameTextContent: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding(.leading, 50)
                    .font(.system(size: 16, weight: .heavy, design: .default))
                Spacer()
                Text(content)
                    .padding(.trailing, 50)
            }.padding(.bottom, 20)
        }
    }
}
