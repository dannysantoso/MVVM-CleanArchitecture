//
//  HomePresenter.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift
import SwiftUI

class HomePresenter: ObservableObject {
    let disposeBag = DisposeBag()
    
    let homeInteractor: HomeInteractor
    let homeRouter: HomeRouter
    
    @Published var gameData: [GameDomain] = []
    
    init(homeInteractor: HomeInteractor, homeRouter: HomeRouter) {
        self.homeInteractor = homeInteractor
        self.homeRouter = homeRouter
    }
    
    func getGames() {
        homeInteractor.getGames()
            .observeOn(MainScheduler.instance)
            .subscribe{ result in
                self.gameData = result
            }onError: { error in
                print(error.localizedDescription)
            }onCompleted: {
                print("Fetching Completed Succesfully")
            }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View>(gameDomain: GameDomain, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(
            destination: homeRouter.moveToDetailView(gameDomain: gameDomain)
        ) { content() }
    }
}
