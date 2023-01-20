//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jaswal, Eesa (SPH) on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var enginePackage = false
    @State private var bodyPackage = false
    @State private var remainingFunds = 1500
    @State private var remainingTime = 30
    
    var timerAt0Seconds: Bool {
        if remainingTime > 0{
            return true
        } else {
            return false
        }
    }
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var tiresPackageEnabled: Bool {
        return tiresPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var enginePackageEnabled: Bool {
        return enginePackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var bodyPackageEnabled: Bool {
        return bodyPackage ? true : remainingFunds >= 1000 ? true : false
    }
    
    let timer = Timer.publish(every:1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    remainingFunds -= 500
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    remainingFunds += 500
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    remainingFunds -= 500
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    remainingFunds += 500
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let enginePackageBinding = Binding<Bool> (
            get: { self.enginePackage },
            set: { newValue in
                self.enginePackage = newValue
                if newValue == true {
                    remainingFunds -= 500
                    starterCars.cars[selectedCar].acceleration -= 0.15
                } else {
                    remainingFunds += 500
                    starterCars.cars[selectedCar].acceleration += 0.15
                }
            }
        )
        
        let bodyPackageBinding = Binding<Bool> (
            get: { self.bodyPackage },
            set: { newValue in
                self.bodyPackage = newValue
                if newValue == true {
                    remainingFunds -= 1000
                    starterCars.cars[selectedCar].topSpeed += 5
                    starterCars.cars[selectedCar].acceleration -= 0.1
                } else {
                    remainingFunds += 1000
                    starterCars.cars[selectedCar].topSpeed -= 5
                    starterCars.cars[selectedCar].acceleration += 0.1
                }
            }
        )
        
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                }
                .foregroundColor(.red)
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].getStatsDisplay())")
                    
                    Button("Next Car", action: {
                        self.exhaustPackage = false
                        self.tiresPackage = false
                        self.enginePackage = false
                        self.bodyPackage = false
                        if selectedCar > starterCars.cars.count - 2 {
                            selectedCar = 0
                        }else {
                            selectedCar += 1
                            resetDisplay()
                        }
                    })
                }
                Section {
                    Toggle("Exhaust Package - £500", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                        .disabled(!timerAt0Seconds)
                    Toggle("Tires Package - £500", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                        .disabled(!timerAt0Seconds)
                    Toggle("Engine Package - £500", isOn: enginePackageBinding)
                        .disabled(!enginePackageEnabled)
                        .disabled(!timerAt0Seconds)
                    Toggle("Body Package - £1000", isOn: bodyPackageBinding)
                        .disabled(!bodyPackageEnabled)
                        .disabled(!timerAt0Seconds)
                }
            }
            Text("Remaining funds: \(remainingFunds)")
                .foregroundColor(.green)
                .baselineOffset(20)
        }
    }
    
    func resetDisplay() {
        remainingFunds = 1500
        starterCars = StarterCars()
        exhaustPackage = false
        tiresPackage = false
        enginePackage = false
        bodyPackage = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
