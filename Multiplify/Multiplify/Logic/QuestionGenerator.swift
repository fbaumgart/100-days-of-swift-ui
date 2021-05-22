//
//  QuestionGenerator.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

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
