//
//  Expenses.swift
//  iExpense
//
//  Created by Filip Baumgart on 28/05/2021.
//

import SwiftUI

final class Expenses: ObservableObject{
  @Published var items = [ExpenseItem]() {
    didSet {
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "Items")
      }
    }
  }
  
  init() {
    if let items = UserDefaults.standard.data(forKey: "Items") {
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
        self.items = decoded
        return
      }
    }
    
    self.items = []
  }
}
