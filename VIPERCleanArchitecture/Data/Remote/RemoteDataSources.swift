//
//  RemoteDataSources.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

class RemoteDataSources {
    
    func getGames() -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create { observer in
            if let url = URL(string: Endpoint.Get.gameList.url) {
                AF.request(url, method: .get)
                    .validate()
                    .responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            let gameResponse = JSON(data)["results"].array?.map { data in
                                GameResponse(id: data["id"].stringValue,
                                             image: data["background_image"].stringValue,
                                             name: data["name"].stringValue,
                                             released: data["released"].stringValue,
                                             rating: data["rating"].stringValue)
                            }
                            if let gameResponse = gameResponse {
                                observer.on(.next(gameResponse))
                                observer.on(.completed)
                            }
                            break
                        case .failure(let error):
                            observer.on(.error(error))
                            break
                        }
                    }
            }
            return Disposables.create()
        }
    }
}
