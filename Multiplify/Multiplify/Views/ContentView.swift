//
//  ContentView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isGameRunning = false
  @State private var firstNumber = 1
  @State private var secondNumber = 10
  @State private var chosenNumberOfQuestions = "All"
  
  private var game: Game {
    Game(firstNumber: firstNumber,
         secondNumber: secondNumber,
         gameVariant: GameVariant.from(string: chosenNumberOfQuestions))
  }
  
  var body: some View {
    NavigationView {
      Group {
        VStack {
          if isGameRunning {
            GameView(game: game)
          } else {
            
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
                  ForEach(GameVariant.allCases, id: \.self.toString) { number in
                    Text("\(number.toString)")
                  }
                }
              }
            }
            
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
      .navigationBarTitle("Multiplify!", displayMode: .large)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct GameView: View {
  
  var game: Game
  @State private var currentQuestionNumber = 0
  var questions: [Question] {
    game.questions
  }
  
  var body: some View {
    VStack {
      Spacer()
      GameViewHeader(question: questions[currentQuestionNumber].question)
      Spacer()
      AnswerButtonsGroup(correctAnswer: questions[currentQuestionNumber].answer)
      Spacer()
    }
    .navigationBarTitle("Question 1 / \(game.questions.count)", displayMode: .inline)
  }
}
