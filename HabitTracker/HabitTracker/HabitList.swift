//
//  HabitList.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 01/07/2021.
//

import SwiftUI

struct HabitList: View {
  var habits: [Habit]
  
  var body: some View {
    List(habits) { habit in
      NavigationLink(
        destination: HabitDetailsView(habit: habit),
        label: {
          HabitRow(habit: habit)
        })
    }
  }
}

struct HabitList_Preview: PreviewProvider {
  static var previews: some View {
    HabitList(habits: [Habit(name: "test", description: "test")])
  }
}
