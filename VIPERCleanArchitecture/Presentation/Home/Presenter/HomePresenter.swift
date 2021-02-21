//
//  HomePresenter.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift

class HomePresenter: ObservableObject {
    let disposeBag = DisposeBag()
    let homeInteractor: HomeInteractor
    
    @Published var gameData: [GameDomain] = []
    
    init(homeInteractor: HomeInteractor) {
        self.homeInteractor = homeInteractor
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
}
