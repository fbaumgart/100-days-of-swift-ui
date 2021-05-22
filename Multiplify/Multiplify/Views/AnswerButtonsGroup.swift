//
//  AnswerButtonsGroup.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

import SwiftUI

struct AnswerButtonsGroup: View {
  
  private let rows = 2
  private let buttonsPerRow = 2
  
  var body: some View {
    ForEach(0 ..< rows) { number in
      HStack {
        ForEach(0 ..< buttonsPerRow) { button in
          AnswerButtonView(number: String(Int.random(in: 0...100)), color: .blue)
        }
      }
    }
  }
}
