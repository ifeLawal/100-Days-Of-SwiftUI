//
//  ContentView.swift
//  WeConvert
//
//  Created by Ifeoluwa Lawal on 12/30/23.
//

import SwiftUI

protocol Converter {
    func convertInput(input: Double, fromUnit: String, toUnit: String) -> Double
}

struct TemperatureConverter: Converter {
    // Fahrenheit to celsius
    func convertInput(input: Double, fromUnit: String, toUnit: String) -> Double {
        switch fromUnit {
        case "celsius":
            switch toUnit {
            case "fahrenheit":
                return (input - 32) * 5 / 9
            case "kelvin":
                return input + 273.15
            default: // default is kelvin
                return 0
            }
        case "fahrenheit":
            switch toUnit {
            case "celsius":
                return (input * 9 / 5) + 32
            case "kelvin":
                return (input - 32) * 5/9 + 273.15
            default: // default is kelvin
                return 0
            }
        case "kelvin":
            switch toUnit {
            case "celsius":
                return input - 273.15
            case "fahrenheit":
                return (input - 273.15) * 9/5 + 32
            default: // default is
                return 0
            }
        default:
            return 0
        }
    }
}

struct ContentView: View {
    @State private var userValue = 0.0
    @State private var currentUnit = "celsius"
    @State private var conversionUnit = "fahrenheit"
    
    let temperatureUnits = ["celsius", "fahrenheit", "kelvin"]
    var possibleTemperatureConversion: [String] {
        temperatureUnits.filter { $0 != currentUnit }
    }
    
    func convertUserValue(_ converter: Converter) -> Double {
        converter.convertInput(input: userValue, fromUnit: currentUnit, toUnit: conversionUnit).rounded()
    }
    let temperatureConverter = TemperatureConverter()
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select input unit", selection: $currentUnit) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }
                
                Section("Input your temperature") {
                    TextField("Input value", value: $userValue, format: .number)
                }
                
                Picker("Conversion unit", selection: $conversionUnit) {
                    ForEach(possibleTemperatureConversion, id: \.self) {
                        Text($0)
                    }
                }
                
                Section("Your temperature in Celsius") {
                    Text(convertUserValue(temperatureConverter), format: .number)
                }
            }.navigationTitle("WeConvert")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
