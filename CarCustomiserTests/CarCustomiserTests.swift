//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Smith, Oli (AMM) on 19/01/2024.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {

    func testNewCar() {
        let car = Car(make: "Toyota", model: "Corolla", topSpeed: 125, acceleration: 5.5, handeling: 4)
        // assert
        XCTAssertEqual(car.make, "Toyota")
        XCTAssertEqual(car.model, "Corolla")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 5.5)
        XCTAssertEqual(car.handeling, 4)
      
    }
    
    
    func testGetStats() {
        let car = Car(make: "Toyota", model: "Corolla", topSpeed: 125, acceleration: 5.5, handeling: 4)
        let expected = """
        Make: Toyota
        Model: Corolla
        Top Speed: 125mph
        Acceleration (0-60): 5.5s
        Handeling: 4
        """
        
        let actual = car.dispayStats()
        
        XCTAssertEqual(actual, expected)
    }
}
