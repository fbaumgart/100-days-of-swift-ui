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
          Button(isGameRunning ? "Exit game" : "Let's play!") {
            isGameRunning.toggle()
          }
          .frame(width: 200, height: 100, alignment: .center)
          .background(Color.red)
          .clipShape(Capsule())
          .font(.largeTitle)
          .foregroundColor(.white)
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
  
  @State var firstNumber = 1
  @State var secondNumber = 1
  private var numberOfQuestions = [ "5", "10", "20", "All" ]
  @State private var chosenNumberOfQuestions = "5"
  
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

struct QuestionGenerator {
  func generate(firstNumber: Int, secondNumber: Int, numberOfQuestions: Int) -> [Question] {
    var questions: [Question] = []
    for _ in 1...numberOfQuestions {
      let firstNumber = Int.random(in: 1...firstNumber)
      let secondNumber = Int.random(in: 1...secondNumber)
      let answer = firstNumber * secondNumber
      let questionString = "\(firstNumber)x\(secondNumber)"
      let question = Question(answer: answer, question: questionString)
      questions.append(question)
    }
    return questions
  }
}

struct Question {
  var answer: Int
  var question: String
}
