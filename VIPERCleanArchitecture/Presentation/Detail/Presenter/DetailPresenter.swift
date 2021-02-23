//
//  DetailPresenter.swift
//  VIPERCleanArchitecture
//
//  Created by danny santoso on 23/02/21.
//

import Foundation

class DetailPresenter: ObservableObject {
     
    let detailInteractor: DetailInteractor
    
    @Published var gameDomain: GameDomain
    
    init(detailInteractor: DetailInteractor) {
        self.detailInteractor = detailInteractor
        self.gameDomain = detailInteractor.getDetailGames()
    }
}
