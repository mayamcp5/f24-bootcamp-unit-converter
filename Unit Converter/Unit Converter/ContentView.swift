//
//  ContentView.swift
//  Unit Converter
//
//  Created by Maya McPartland on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var inValue = 0.0
    @State var inUnit = "mL"
    @State var outUnit = "mL"
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var toMl: Double {
        if inUnit == "Liters" {
            return inValue * 1000.0
        }
        if inUnit == "Cups" {
            return inValue * 236.588
        }
        if inUnit == "Pints" {
            return inValue * 473.176
        }
        if inUnit == "Gallons" {
            return inValue * 3785.41
        } else {
            return inValue
        }
    }
    
    var output: Double {
        if outUnit == "Liters" {
            return toMl / 1000.0
        }
        if outUnit == "Cups" {
            return toMl / 236.588
        }
        if outUnit == "Pints" {
            return toMl / 473.176
        }
        if outUnit == "Gallons" {
            return toMl / 3785.41
        } else {
            return toMl
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value and Unit") {
                    TextField("Input Value", value: $inValue, format: .number)
                    Picker("Select input unit", selection: $inUnit) {
                        ForEach(units, id: \.self) {unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Convert to") {
                    Picker("Select input unit", selection: $outUnit) {
                        ForEach(units, id: \.self) {unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Output") {
                    Text("\(output, specifier: "%.2f")")
                }
            }.navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}
