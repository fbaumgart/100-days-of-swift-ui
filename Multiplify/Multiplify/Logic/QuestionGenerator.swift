//
//  QuestionGenerator.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

struct QuestionGenerator {
  func generate(firstNumber: Int, secondNumber: Int, gameVariant: GameVariant) -> [Question] {
    switch gameVariant {
    case .five, .ten, .twenty: return generate(for: gameVariant.toInt, firstNumber: firstNumber, secondNumber: secondNumber)
    case .all: return generateAllVariants(firstNumber: firstNumber, secondNumber: secondNumber)
    }
  }
  
  private func generate(for numberOfQuestions: Int, firstNumber: Int, secondNumber: Int) -> [Question] {
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
  
  private func generateAllVariants(firstNumber: Int, secondNumber: Int) -> [Question] {
    var alreadyStoredAnswers: Set<Int> = []
    var questions: [Question] = []
    for a in 1...firstNumber {
      for b in 1...secondNumber {
        let number = a * b
        if !alreadyStoredAnswers.contains(number) {
          alreadyStoredAnswers.insert(number)
          let question = Question(answer: number, question: "\(a) x \(b)")
          questions.append(question)
        }
      }
    }
    questions.shuffle()
    return questions
  }
}

