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
  
  private let questionsGenerator = QuestionGenerator()
  
  var questions: [Question] {
    return questionsGenerator.generate(firstNumber: firstNumber, secondNumber: secondNumber, gameVariant: gameVariant)
  }
}
