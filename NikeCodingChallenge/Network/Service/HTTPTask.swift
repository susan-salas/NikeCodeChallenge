//
//  HTTPTask.swift
//  NetworkFramework
//
//  Created by Susan Salas on 3/30/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case requestPlain
    case requestParameters(Parameters)
}
