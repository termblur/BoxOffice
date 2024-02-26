//
//  BoxOfficeUITests.swift
//  BoxOfficeUITests
//
//  Created by STJANG on 2/23/24.
//

import XCTest

final class BoxOfficeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        let delayExpectation = XCTestExpectation()
        let table = app.tables.matching(identifier: "tableView")
        let cell = table.cells.element(matching: .cell, identifier: "cell_0")
        app.launch()
        
        app.datePickers["datePicker"].tap()
        XCTAssertTrue(app.segmentedControls["segmentedControl"].buttons["주중(월~목)"].exists)
        XCTAssertTrue(app.datePickers.collectionViews.buttons["2월 2일 금요일"].exists)
        app.datePickers.collectionViews.buttons["2월 2일 금요일"].tap()
        app.buttons["searchButton"].tap()
        delayExpectation.isInverted = true
        wait(for: [delayExpectation], timeout: 2)
        cell.tap()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
