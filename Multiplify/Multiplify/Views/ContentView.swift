//
//  ContentView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isGameRunning = true
  @State private var configurationView = ConfigurationView()
  private var game: Game {
    configurationView.game
  }
  
  var body: some View {
    NavigationView {
      Group {
        VStack {
          if isGameRunning {
            GameView(game: game)
          } else {
            configurationView
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
