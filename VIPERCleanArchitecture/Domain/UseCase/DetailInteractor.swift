//
//  DetailInteractor.swift
//  VIPERCleanArchitecture
//
//  Created by danny santoso on 23/02/21.
//

import Foundation

class DetailInteractor {
    
    var gameDomain: GameDomain
    
    init(gameDomain: GameDomain) {
        self.gameDomain = gameDomain
    }
    
    func getDetailGames() -> GameDomain{
        return gameDomain
    }
    
}
