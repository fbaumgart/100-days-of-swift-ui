//
//  ContentView.swift
//  BetterRest
//
//  Created by Filip Baumgart on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date()
  
  var body: some View {
    Form {
      DatePicker("Please enter a date", selection: $wakeUp)
        .labelsHidden()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
