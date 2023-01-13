//
//  Car.swift
//  CarCustomiser
//
//  Created by Jaswal, Eesa (SPH) on 13/01/2023.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func getStatsDisplay() -> String {
        let statsDisplay = (" Make: \(make) \n Model: \(model) \n Top Speed: \(topSpeed)mph \n Acceleration (0-60): \(acceleration)s \n Handling: \(handling)")
        return statsDisplay
    }
}
