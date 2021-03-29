//
//  DI.swift
//  VIPERCleanArchitecture
//
//  Created by danny santoso on 29/03/21.
//

import Foundation

final class Injection {
  
  private func provideRepository() -> Repository {
    

    let locale: LocaleDataSources = LocaleDataSources.sharedInstance
    let remote: RemoteDataSources = RemoteDataSources.sharedInstance

    return Repository.sharedInstance(remote, locale)
  }

  func provideHome() -> HomeInteractor {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }

  func provideDetail(gameDomain: GameDomain) -> DetailInteractor {
    return DetailInteractor(gameDomain: gameDomain)
  }

}
