//
//  NetworkResponse.swift
//  NetworkFramework
//
//  Created by Susan Salas on 3/30/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}

enum NetworkError: Error {
    case unknown
    case noJSONData
    case decodingError
}
