//
//  Game.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

struct Game {
  var firstNumber: Int
  var secondNumber: Int
  var gameVariant: GameVariant
  var questions: [Question]
  
  init(firstNumber: Int, secondNumber: Int, gameVariant: GameVariant) {
    self.firstNumber = firstNumber
    self.secondNumber = secondNumber
    self.gameVariant = gameVariant
    self.questions = QuestionGenerator().generate(firstNumber: firstNumber, secondNumber: secondNumber, gameVariant: gameVariant)
  }
}
