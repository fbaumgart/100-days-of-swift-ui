//
//  ContentView.swift
//  UnitConverter
//
//  Created by Filip Baumgart on 25/04/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var inputValue = ""
  @State private var inputUnit = ""
  @State private var outputUnit = ""
  
  let temperatureUnits = ["Kelvin", "Celsius", "Fahrenheit"]
  
    var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Input value and choose unit")) {
            TextField("Input", text: $inputValue).keyboardType(.decimalPad)
            Picker("Input unit", selection: $inputUnit) {
              ForEach(0 ..< temperatureUnits.count) {
                Text("\(temperatureUnits[$0])")
              }
            }.pickerStyle(SegmentedPickerStyle())
          }
          
          Section(header: Text("Choose output unit")) {
            Picker("Output unit", selection: $outputUnit) {
              ForEach(0 ..< temperatureUnits.count) {
                Text("\(temperatureUnits[$0])")
              }
            }.pickerStyle(SegmentedPickerStyle())
            Text("Result")
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
