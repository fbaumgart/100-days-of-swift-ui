//
//  ContentView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isGameRunning = false
  
  var body: some View {
    NavigationView {
      Group {
        VStack {
          if isGameRunning {
            GameView()
          } else {
            ConfigurationView()
          }
          Button("Toogle!") {
            isGameRunning.toggle()
          }
        }
      }
      .navigationBarTitle("Multiplify!")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ConfigurationView: View {
  
  @State private var firstNumber = 1
  @State private var secondNumber = 1
  private var numberOfQuestions = [ "5", "10", "20", "All" ]
  @State private var chosenNumberOfQuestions = 1
  
  var body: some View {
    Form {
      Section(header: Text("I want to mulitply:")) {
        Stepper(value: $firstNumber, in: 1...12, step: 1) {
          Text("From: \(firstNumber)")
        }
        Stepper(value: $secondNumber, in: 1...12, step: 1) {
          Text("To: \(secondNumber)")
        }
      }
      Section(header: Text("How many questions?")) {
        Picker("\(numberOfQuestions[chosenNumberOfQuestions])", selection: $chosenNumberOfQuestions) {
          ForEach(numberOfQuestions, id: \.self) { number in
            Text("\(number)")
          }
        }
      }
    }
  }
}
