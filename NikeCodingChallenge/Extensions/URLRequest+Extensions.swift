//
//  URLRequest+Extensions.swift
//  NetworkFramework
//
//  Created by Susan Salas on 3/30/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

extension URLRequest {

    init(service: EndPointType) {
        let urlComponents = URLComponents(service: service)

        self.init(url: urlComponents.url!)

        httpMethod = service.method.rawValue
        service.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }

        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .json else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
}
