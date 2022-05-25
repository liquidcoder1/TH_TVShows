// File: TVShowViewModelTests.swift
// Project: DistilledMovieApp

import XCTest
@testable import DistilledMovieApp

class TVShowViewModelTests: XCTestCase {

    var tvShowViewModel: TVShowViewModel?
    
    override func setUpWithError() throws {
        tvShowViewModel = TVShowViewModel(.testing)
    }

    override func tearDownWithError() throws {
        tvShowViewModel = nil
    }
    
    func test_fetchTvShows()  {
        let expectation = XCTestExpectation(description: "tvShowsResponse")
        var tvShows = [TVShow]()
        tvShowViewModel?.fetchTvShows(pageNumber: 1,
                                      response: { result in
            if case let .success(items) = result { tvShows = items }
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 1)
        // More can be added
        XCTAssertEqual(tvShows.count, 20)
    }

}
