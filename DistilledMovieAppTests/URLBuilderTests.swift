// File: URLBuilderTests.swift
// Project: DistilledMovieApp

import XCTest
@testable import DistilledMovieApp

class URLBuilderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_apiBuild() {
        
        let expected = URL(string: "https://api.themoviedb.org/3?api_key=25a8f80ba018b52efb64f05140f6b43c")!
        
        let url = URLBuilder().build()
        XCTAssertEqual(url, expected)
        
    }
    
    func test_imageBuild() {
        
        let expected = URL(string: "https://image.tmdb.org/t/p?")!
        
        let url = URLBuilder(isImage: true).build()
        XCTAssertEqual(url, expected)
        
    }
    
    func test_buildTopRated() {
        let expected = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=25a8f80ba018b52efb64f05140f6b43c&language=en-US&page=1")!

        let url = URLBuilder.topRated()
        XCTAssertEqual(url, expected)
    }
    
    func test_imageUrl() {
        let expected = URL(string: "https://image.tmdb.org/t/p/w500/nMhv6jG5dtLdW7rgguYWvpbk0YN.jpg?")!
        
        let url = URLBuilder.imageUrl("nMhv6jG5dtLdW7rgguYWvpbk0YN.jpg")
        XCTAssertEqual(url, expected)
    }
    
}
