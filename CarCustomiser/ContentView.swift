//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jaswal, Eesa (SPH) on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling:5)
    
    var body: some View {
        Text(" Make: \(car.make) \n Model: \(car.model) \n Top Speed: \(car.topSpeed)mph \n Acceleration (0-60): \(car.acceleration)s \n Handling: \(car.handling)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
