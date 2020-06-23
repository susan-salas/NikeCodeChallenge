//
//  NikeCodingChallengeTests.swift
//  NikeCodingChallengeTests
//
//  Created by Susan Salas on 3/23/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import XCTest
@testable import NikeCodingChallenge

class NikeCodingChallengeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFeedAPIRequestYieldsExpectedResult() {
        
        let mockDataTask = URLSessionMock.init(service: FeedAPI.getTop100Albums)
        let dataProvider = URLSessionProvider.init(session: mockDataTask)
        
        dataProvider.request(type: FeedResponse.self, service: FeedAPI.getTop100Albums) { (response) in
            switch response {
            case let .success(response):
                XCTAssertEqual(response.feed?.results?.first?.name, "After Hours (Deluxe)")
                XCTAssertEqual(response.feed?.results?.first?.artistName, "The Weeknd")
                XCTAssertEqual(response.feed?.results?.first?.artworkUrl100, "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/c3/84/3dc384fd-1f26-1df6-47e0-a9af382f2a98/20UMGIM21166.rgb.jpg/200x200bb.png")
            default:
                break
            }
        }
    }

}
