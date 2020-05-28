//
//  Album.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

struct Album: Decodable {
    
    let id:String?
    let artistName:String?
    let name:String?
    let artworkUrl100:String?
    let url:String?
    let copyright:String?
    let genres:[Genre]?
    let releaseDate:String?
    
}
