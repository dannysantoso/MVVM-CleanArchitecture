//
//  HomeInteractor.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift

class HomeInteractor {
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func getGames() -> Observable<[GameDomain]> {
        return repository.getGames().map {
            $0.sorted(by: {
                $0.name < $1.name
            })
        }
    }
    
}
