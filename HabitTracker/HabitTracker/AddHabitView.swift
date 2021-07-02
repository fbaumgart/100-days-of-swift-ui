//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 02/07/2021.
//

import SwiftUI

struct AddHabitView: View {
  
  @State private var name: String = ""
  @State private var description: String = ""
  @Environment(\.presentationMode) private var presentationMode
  @State private var isShowingError = false
  
  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        TextField("Description", text: $description)
      }
      .navigationTitle("Add new habit")
      .navigationBarItems(trailing: Button("Save", action: {
        verifyInput(success: { habit in
          print(habit.name)
          presentationMode.wrappedValue.dismiss()
        }, failure: {
          isShowingError.toggle()
        })
      }))
      .alert(isPresented: $isShowingError, content: {
        Alert(title: Text("Empty input"), message: Text("Inputs cannot be empty!"), dismissButton: .default(Text("Close")))
      })
    }
  }
  
  private func verifyInput(success: (Habit) -> Void, failure: () -> Void) {
    guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
          !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      failure()
      return
    }
    return success(Habit(name: name, description: description))
  }
  
}

struct AddHabitView_Preview: PreviewProvider {
  static var previews: some View {
    AddHabitView()
  }
}
