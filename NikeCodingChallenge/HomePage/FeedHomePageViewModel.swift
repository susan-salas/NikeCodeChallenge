//
//  FeedHomePageViewModel.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation


class HomePageViewModel {

    var albumData:Observable<[Album]>
    private var sessionProvider:URLSessionProvider

    init(dataProvider: URLSessionProvider = URLSessionProvider()) {
        self.sessionProvider = dataProvider
        
        albumData = Observable.init([])
    }
    
    
    func loadData() {
        sessionProvider.request(type: FeedResponse.self, service: FeedAPI.getTop100Albums) {  [weak self] (response) in
            switch response {
            case let .success(response):
                if let results = response.feed?.results {
                    self?.albumData.value = results
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}



