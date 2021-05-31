//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Filip Baumgart on 31/05/2021.
//

import SwiftUI

struct ExpenseItemView: View {
  
  var item: ExpenseItem
  private var manager: ExpenseItemStyleManager.Type {
    return ExpenseItemStyleManager.self
  }
  
  var body: some View {
    HStack {
      Rectangle()
        .frame(width: manager.getWidth(for: item.amount), height: 50, alignment: .leading)
        .foregroundColor(manager.getBackground(for: item.amount))
      VStack(alignment: .leading) {
        Text(item.name)
          .font(.headline)
        Text(item.type)
      }
      Spacer()
      HStack {
        Text("$\(item.amount)")
          .padding()
        Circle()
          .frame(width: 20, height: 20, alignment: .trailing)
          .foregroundColor(manager.getBackground(for: item.amount))
      }
    }
    .padding()
    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
  }
}

struct ExpenseItemView_Previews: PreviewProvider {
  static var previews: some View {
    ExpenseItemView(item: ExpenseItem(name: "Shopping",
                                      type: "Personal",
                                      amount: 1))
  }
}
