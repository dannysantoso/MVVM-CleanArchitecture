//
//  ContentView.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 20/02/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homePresenter: HomePresenter
    
    var body: some View {
        NavigationView {
            List {
                ForEach(homePresenter.gameData) { game in
                    ListView(game: game)
                }
            }.onAppear{
                homePresenter.getGames()
            }
            .navigationBarTitle("Game List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homePresenter: HomePresenter(homeInteractor: HomeInteractor(repository: Repository(remoteDataSources: RemoteDataSources(), localeDataSources: LocaleDataSources()))))
    }
}
