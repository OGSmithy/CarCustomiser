//
//  Car.swift
//  CarCustomiser
//
//  Created by Smith, Oli (AMM) on 22/01/2024.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handeling: Int
    
    func dispayStats() -> String {
        return """
        Make: \(make)
        Model: \(model)
        Top Speed: \(topSpeed)mph
        Acceleration (0-60): \(acceleration)s
        Handeling: \(handeling)
        """
    }
    
    

}
