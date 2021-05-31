//
//  AddView.swift
//  iExpense
//
//  Created by Filip Baumgart on 29/05/2021.
//

import SwiftUI

struct AddView: View {
  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = ""
  @State private var isShowingErrorAlert = false
  @State private var errorMessage = ""
  @ObservedObject var expenses: Expenses
  @Environment(\.presentationMode) private var presentationMode
  
  private static let types = ["Business", "Personal"]
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        Picker("Type", selection: $type) {
          ForEach(Self.types, id: \.self) {
            Text($0)
          }
        }
        TextField("Amount", text: $amount)
          .keyboardType(.numberPad)
      }
      .navigationBarTitle("Add new expense")
      .navigationBarItems(trailing: Button("Save") {
        verifyInput { item in
          expenses.items.append(item)
          presentationMode.wrappedValue.dismiss()
        } failure: { error in
          errorMessage = error.message
          isShowingErrorAlert.toggle()
        }
      })
      .alert(isPresented: $isShowingErrorAlert, content: {
        Alert(title: Text("Invalid input!"), message: Text(errorMessage), dismissButton: .default(Text("Close")))
      })
    }
  }
  
  private func verifyInput(success: (ExpenseItem) -> Void, failure: (UserInputError) -> Void) {
    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      return failure(.emptyName)
    }
    
    guard !amount.isEmpty else { return failure(.emptyAmount) }
    
    guard let amount = Int(amount.trimmingCharacters(in: .whitespacesAndNewlines)) else {
      return failure(.illegalCharacters)
    }
    
    guard amount > 0 else { return failure(.negativeAmount) }
    
    let expenseItem = ExpenseItem(name: name, type: type, amount: amount)
    return success(expenseItem)
  }
}

struct AddView_Previews: PreviewProvider {
  
  static var previews: some View {
    AddView(expenses: Expenses())
  }
}

enum UserInputError {
  case negativeAmount, emptyName, illegalCharacters, emptyAmount
  
  var message: String {
    switch self {
    case .emptyAmount: return "Amount field is empty!"
    case .negativeAmount: return "Please provide amount over zero!"
    case .emptyName: return "Name field is empty!"
    case .illegalCharacters: return "Illegal characters in the amount field!"
    }
  }
}
