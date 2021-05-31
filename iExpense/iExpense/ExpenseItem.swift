//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Filip Baumgart on 28/05/2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: String
  let amount: Int
}
