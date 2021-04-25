//
//  ContentView.swift
//  UnitConverter
//
//  Created by Filip Baumgart on 25/04/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var inputValue = ""
  @State private var inputUnit = 0
  @State private var outputUnit = 0
  
  let temperatureUnits = TemparatureUnit.allCases
  
  var outputValue: Double {
    guard let value = Double(inputValue) else { return 0 }
    let inputTemperatureUnit = temperatureUnits[inputUnit].unit
    let outputTemperatureUnit = temperatureUnits[outputUnit].unit
    let measurement = Measurement(value: value, unit: inputTemperatureUnit)
    let convertedResult = measurement.converted(to: outputTemperatureUnit)
    return convertedResult.value
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Input value and choose unit")) {
          TextField("Input temperature", text: $inputValue).keyboardType(.decimalPad)
          Picker("Input unit", selection: $inputUnit) {
            ForEach(0 ..< temperatureUnits.count) {
              Text("\(temperatureUnits[$0].rawValue)")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Choose output unit")) {
          Picker("Output unit", selection: $outputUnit) {
            ForEach(0 ..< temperatureUnits.count) {
              Text("\(temperatureUnits[$0].rawValue)")
            }
          }.pickerStyle(SegmentedPickerStyle())
          Text("\(outputValue, specifier: "%.2f")").foregroundColor(.gray)
        }
      }.navigationTitle("Unit converter")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

enum TemparatureUnit: String, CaseIterable {
  case Celsius, Kelvin, Fahrenheit
  
  var unit: UnitTemperature {
    switch self {
    case .Celsius: return .celsius
    case .Fahrenheit: return .fahrenheit
    case .Kelvin: return .kelvin
    }
  }
}
