//
//  GameMapping.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift

class GameMapping {
    static func gameResponseToDomain(gameResponse: [GameResponse]) -> [GameDomain] {
        return gameResponse.map { result in
            GameDomain(
                id: result.id,
                image: result.image,
                name: result.name,
                released: result.released,
                rating: result.rating
            )
        }
    }
    
    static func gameEntityToDomain(gameEntity: [GameEntity]) -> [GameDomain] {
        return gameEntity.map { result in
            GameDomain(
                id: result.id ?? "",
                image: result.image ?? "",
                name: result.name ?? "",
                released: result.released ?? "",
                rating: result.rating ?? ""
            )
        }
    }
    
    static func gameResponseToEntity(gameResponse: [GameResponse]) {
        _ = gameResponse.map { result in
            let gameEntity = GameEntity(context: CoreDataContext.viewContext())
            gameEntity.id = result.id
            gameEntity.image = result.image
            gameEntity.name = result.name
            gameEntity.released = result.released
            gameEntity.rating = result.rating
        }
    }
}


