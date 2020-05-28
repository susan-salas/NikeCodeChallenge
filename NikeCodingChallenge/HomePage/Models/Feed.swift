//
//  Feed.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    
    let id:String?
    let title:String?
    let results:[Album]?
}
