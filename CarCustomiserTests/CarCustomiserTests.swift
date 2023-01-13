//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Jaswal, Eesa (SPH) on 12/01/2023.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {
    
    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling:5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
        func testStatsDisplayReturnsCorrectText() {
        //arrange
        let expectedStatsDisplay = " Make: Mazda \n Model: MX-5 \n Top Speed: 125mph \n Acceleration (0-60): 7.7s \n Handling: 5"
        print(expectedStatsDisplay)
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling:5)
        //assert
        XCTAssertEqual(car.getStatsDisplay(), expectedStatsDisplay)
            
    }
}
