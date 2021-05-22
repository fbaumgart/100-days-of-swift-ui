//
//  ConfigurationView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 18/05/2021.
//

import SwiftUI

struct ConfigurationView: View {
  
  @State var firstNumber = 1
  @State var secondNumber = 1
  private var numberOfQuestions = [ "5", "10", "20", "All" ]
  @State private var chosenNumberOfQuestions = "5"
  var game: Game {
    return Game(firstNumber: firstNumber,
                secondNumber: secondNumber,
                gameVariant: GameVariant.from(string: chosenNumberOfQuestions))
  }
  
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
        Picker("Number of questions", selection: $chosenNumberOfQuestions) {
          ForEach(numberOfQuestions, id: \.self) { number in
            Text("\(number)")
          }
        }
      }
    }
  }
}
