//
//  AnswerButtonsGroup.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

import SwiftUI

struct AnswerButtonsGroup: View {
  
  var correctAnswer: Int
  var onButtonPress: (String) -> Void
  
  private let rows = 2
  private let buttonsPerRow = 2
  private let buttonToPutAnswerTo = (row: Int.random(in: 0...1), button: Int.random(in: 0...1))
  
  var body: some View {
    ForEach(0 ..< rows) { rowNumber in
      HStack {
        ForEach(0 ..< buttonsPerRow) { buttonNumber in
          let currentButtonIndex = (row: rowNumber, button: buttonNumber)
          let number = buttonToPutAnswerTo == currentButtonIndex ? String(correctAnswer) : String(Int.random(in: 0...100))
          AnswerButtonView(number: number, color: .blue, onButtonPress: onButtonPress)
        }
      }
    }
    .transition(.slide)
    .animation(.easeIn)
  }
}
