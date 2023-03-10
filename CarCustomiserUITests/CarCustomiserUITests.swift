//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Jaswal, Eesa (SPH) on 12/01/2023.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresExhaustAndEnginePackageOtherUpgradesAreDisabled() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["Exhaust Package - £500"].tap()
        app.switches["Tires Package - £500"].tap()
        app.switches["Engine Package - £500"].tap()
        //assert
        XCTAssertEqual(app.switches["Body Package - £1000"].isEnabled, false)
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
