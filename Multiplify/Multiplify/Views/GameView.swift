//
//  GameView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 18/05/2021.
//

import SwiftUI

struct GameView: View {
  
  @State var game: Game
  @State var currentQuestionNumber = 0
  @State var isAlertShowing = false
  @State var correctAnswersCounter = 0
  var questions: [Question] {
    game.questions
  }
  var answer: String {
    String(questions[currentQuestionNumber].answer)
  }
  
  var body: some View {
    VStack {
      Spacer()
      GameViewHeader(question: questions[currentQuestionNumber].question)
      Spacer()
      AnswerButtonsGroup(correctAnswer: questions[currentQuestionNumber].answer,
                         onButtonPress: onButtonPress(answer: answer))
      Spacer()
    }
    .navigationBarTitle("Question \(currentQuestionNumber + 1) / \(game.questions.count)", displayMode: .inline)
    .alert(isPresented: $isAlertShowing,
           content: {
            Alert(title: Text("Game over!"),
                  message: Text("You answered correctly \(correctAnswersCounter) questions."),
                  dismissButton: .default(Text("Retry"),
                                          action: {
                                            resetGame()
                                          }))
           })
  }
  
  private func onButtonPress(answer: String) -> (String) -> Void {
    let closure: (String) -> Void = { clickedNumber in
      if clickedNumber == answer {
        correctAnswersCounter += 1
      }
      nextQuestion()
    }
    return closure
  }
  
  private func nextQuestion() {
    if currentQuestionNumber + 1 != questions.count {
      currentQuestionNumber += 1
    } else {
      isAlertShowing = true
    }
  }
  
  private func resetGame() {
    currentQuestionNumber = 0
    correctAnswersCounter = 0
    let currentGame = game
    game = Game(firstNumber: currentGame.firstNumber, secondNumber: currentGame.secondNumber, gameVariant: currentGame.gameVariant)
  }
}
