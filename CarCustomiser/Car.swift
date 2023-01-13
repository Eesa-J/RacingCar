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
        let statsDisplay = """
                            Make: \(make)
                            Model: \(model)
                            Top Speed: \(topSpeed)mph
                            Acceleration (0-60): \(acceleration)s
                            Handling: \(handling)
                            """
        return statsDisplay
    }
}
