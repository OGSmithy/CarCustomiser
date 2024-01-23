//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Smith, Oli (AMM) on 19/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var superchargerPackage = false
    @State private var absPackage = false
    @State private var remainingFunds = 1000
    
    var exhaustPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else  {
            return false
        }
    }
    var tiresPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else  {
            return false
        }
    }
    var superchargerPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else  {
            return false
        }    }
    var absPackageEnabled: Bool {
        if remainingFunds >= 1000 {
            return true
        } else  {
            return false
        }
    }
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
                
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get : {self.exhaustPackage },
            set : { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handeling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handeling -= 2
                }
            }
        )
        let superchargerPackageBinding = Binding<Bool> (
            get : { self.superchargerPackage },
            set : { newValue in self.superchargerPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.3
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.3
                }
            }
        )
        let absPackageBinding = Binding<Bool> (
            get : { self.absPackage },
            set : { newValue in self.absPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handeling += 1
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].handeling -= 1
                }
            }
        )
        VStack {
            Form {
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].dispayStats())")
                    
                    Button("Random Car",action: {
                        selectedCar += 1
                        resetDisplay()
                        
                    })
                }
                Section {
                    Toggle("Exhaust Package (Cost: £500)", isOn: $exhaustPackage)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package (Cost: £500)", isOn: $tiresPackage)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Supercharger Package (Cost: £500) ", isOn: $superchargerPackage)
                        .disabled(!superchargerPackageEnabled)
                    Toggle("ABS Package (Cost: £1000)", isOn: $absPackage)
                        .disabled(!absPackageEnabled)
                }
            }
            Text("Remaining Funds: £\(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
    
    func resetDisplay() {
        exhaustPackage = false
        tiresPackage = false
        superchargerPackage = false
        absPackage = false
        remainingFunds = 1000
        starterCars = StarterCars()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//#Preview {
  //  ContentView()
//}
