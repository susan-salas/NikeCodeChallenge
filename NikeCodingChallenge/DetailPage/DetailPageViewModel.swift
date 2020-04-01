//
//  DetailPageViewModel.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation


class DetailPageViewModel  {
    

    var albumImage:String
    var albumName:String
    var artistName:String
    var genre:String
    var releaseDate:String
    var copyRightInfo:String
    var albumURL:String
    private var model:Album
    
    init(with album: Album) {
        model = album
        albumImage = album.artworkUrl100
        albumName = album.name
        artistName = album.artistName
        genre = album.genres.first?.name ?? ""
        releaseDate = "Released: \(album.releaseDate)"
        copyRightInfo = album.copyright
        albumURL = album.url
    }
    
    func getItunesLink() -> String{
        
        return model.url.replacingOccurrences(of: "https", with: "itms")
        
    }
    
}

