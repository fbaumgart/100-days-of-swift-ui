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
  var questions: [Question] {
    return [Question(answer: 4, question: "3x3")]
  }
}
