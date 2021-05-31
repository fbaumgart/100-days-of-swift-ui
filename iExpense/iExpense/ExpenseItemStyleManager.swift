//
//  ExpenseItemStyleManager.swift
//  iExpense
//
//  Created by Filip Baumgart on 31/05/2021.
//

import SwiftUI

enum ExpenseItemStyleManager {
  
  static func getWidth(for value: Int) -> CGFloat {
    switch value {
    case 0 ..< 10: return 5
    case 10 ..< 100: return 7
    case 100 ..< Int.max: return 10
    default: return 5
    }
  }
  
  static func getBackground(for value: Int) -> Color {
    switch value {
    case 0 ..< 10: return .gray
    case 10 ..< 100: return .yellow
    case 100 ..< Int.max: return .red
    default: return .white
    }
  }
}
