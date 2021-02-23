//
//  ApiCall.swift
//  VIPER-CleanArchitecture
//
//  Created by danny santoso on 21/02/21.
//

import Foundation


struct ApiCall {
    
    static let baseURL = "https://api.rawg.io/api/"
    
}

enum Endpoint {
    
    enum Get {
        case gameList
        
        public var url: String {
            switch self {
            case .gameList:
                return "\(ApiCall.baseURL)games"
            }
        }
    }
}

