//
//  FeedAPI.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/30/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

public enum FeedAPI {
    
    case getTop100Albums

}


extension FeedAPI: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        return "top-albums/all/100/explicit.json"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .requestPlain
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var parametersEncoding: ParameterEncoding {
        return .url
    }
    
    var stubbedResponse: String {
        return "getTop100Albums"
    }
    
    
    
}

