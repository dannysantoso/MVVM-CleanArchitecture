//
//  HomeRouter.swift
//  VIPERCleanArchitecture
//
//  Created by danny santoso on 23/02/21.
//

import Foundation
import SwiftUI

class HomeRouter {
    
    func moveToDetailView(gameDomain: GameDomain) -> some View {
        let detailInteractor = Injection.init().provideDetail(gameDomain: gameDomain)
        let presenter = DetailPresenter(detailInteractor: detailInteractor)
        return DetailView(detailPresenter: presenter)
    }
    
}
