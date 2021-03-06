//
//  Repository.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift

class Repository {
    let remoteDataSources: RemoteDataSources
    let localeDataSources: LocaleDataSources
    
    typealias RepoInstances = (RemoteDataSources, LocaleDataSources) -> Repository
    
    init(remoteDataSources: RemoteDataSources, localeDataSources: LocaleDataSources) {
        self.remoteDataSources = remoteDataSources
        self.localeDataSources = localeDataSources
    }
    
    static let sharedInstance: RepoInstances = { remoteRepo, localeRepo in
        return Repository(remoteDataSources: remoteRepo, localeDataSources: localeRepo)
    }
    
    func getGames() -> Observable<[GameDomain]> {
        return localeDataSources.getGames()
            .map { GameMapping.gameEntityToDomain(gameEntity: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: self.remoteDataSources.getGames()
                        .map{ GameMapping.gameResponseToEntity(gameResponse: $0) }
                        .flatMap { self.localeDataSources.saveGames() }
                        .filter{ $0 }
                        .flatMap { _ in self.localeDataSources.getGames()
                            .map { GameMapping.gameEntityToDomain(gameEntity: $0) }
                        }
            )
    }
}
