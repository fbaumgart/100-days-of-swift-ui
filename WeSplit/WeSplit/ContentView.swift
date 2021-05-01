//
//  ContentView.swift
//  WeSplit
//
//  Created by Filip Baumgart on 19/04/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var checkAmount = ""
  @State private var numberOfPeople = ""
  @State private var tipPercentage = 2
  private let tipPercentages = [10, 15, 20, 25, 0]
  
  private var shouldDisplayRedFont: Bool { tipPercentages[tipPercentage] == 0 }
  
  private var totalPerPerson: Double {
    let numberOfPeople = Double(self.numberOfPeople) ?? 0
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    
    let tipValue = orderAmount / 100 * tipSelection
    let grandTotal = orderAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount

    return amountPerPerson
  }
  
  private var totalAmount: Double {
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    
    let tipValue = orderAmount / 100 * tipSelection
    let grandTotal = orderAmount + tipValue
    
    return grandTotal
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          
          TextField("Number of people", text: $numberOfPeople)
            .keyboardType(.numberPad)
        }
        
        Section(header: Text("How much tip do you want to leave?")) {
          
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Amount per person")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
        
        Section(header: Text("Total amount")) {
          Text("$\(totalAmount, specifier: "%.2f")")
            .foregroundColor(shouldDisplayRedFont ? .red : .black)
        }
      }.navigationBarTitle("WeSplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
