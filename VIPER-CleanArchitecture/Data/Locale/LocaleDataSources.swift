//
//  LocaleDataSources.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift
import CoreData

class LocaleDataSources {
    
    func getGames() -> Observable<[GameEntity]> {
        return Observable<[GameEntity]>.create { observer in
            do {
                let request: NSFetchRequest<GameEntity> = GameEntity.fetchRequest()
                let result = try CoreDataContext.viewContext().fetch(request)
                
                observer.on(.next(result))
                observer.on(.completed)
            } catch let error {
                observer.on(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func saveGames() -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            do {
                try CoreDataContext.viewContext().save()
                observer.on(.next(true))
                observer.on(.completed)
            } catch let error {
                observer.on(.error(error))
            }
            return Disposables.create()
        }
    }
    
    
}
