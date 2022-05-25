// File: HomeScreenObject.swift
// Project: DistilledMovieApp

import Foundation
import XCTest

class HomeScreenObject {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var sortButton: XCUIElement {
        app.buttons["sortButton"]
    }
    
    private var scrollView: XCUIElement {
        app.scrollViews.firstMatch
    }
    
    func isDisplaying() -> Bool {
        sortButton.exists && scrollView.waitForExistence(timeout: 1)
    }

}
