//
//  URLComponents+Extensions.swift
//  NetworkFramework
//
//  Created by Susan Salas on 3/30/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

extension URLComponents {
    
    init(service: EndPointType) {
        let url = service.baseURL.appendingPathComponent(service.path)
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .url else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
