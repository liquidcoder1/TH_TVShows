// File: DistilledMovieAppUITests.swift
// Project: DistilledMovieApp

import XCTest
@testable import DistilledMovieApp

class DistilledMovieAppUITests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        app.launchArguments.append(Constants.testingFlag)
        app.launch()
    }

    override func tearDownWithError() throws {
    
    }

    func testHomeScreen() throws {
        XCTAssert(HomeScreenObject(app: app).isDisplaying())
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
