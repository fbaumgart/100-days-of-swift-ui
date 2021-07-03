//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 03/07/2021.
//

import SwiftUI

struct HabitDetailsView: View {
  
  var habit: Habit
  
  var body: some View {
    NavigationView {
      VStack {
        Form {
          HStack {
            Text("Name:")
            Text(habit.name)
              .font(.headline)
          }
          HStack {
            Text("Description:")
            Text(habit.description)
              .font(.headline)
          }
        }
      }
      .navigationTitle("Details")
    }
  }
}

struct HabitDetailsView_Preview: PreviewProvider {
  static var previews: some View {
    HabitDetailsView(habit: Habit(name: "test", description: "test"))
  }
}
