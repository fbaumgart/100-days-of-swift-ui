//
//  HabitList.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 01/07/2021.
//

import SwiftUI

struct HabitList: View {
  @ObservedObject var habits: Habits
  
  var body: some View {
    List(habits.items) { habit in
      NavigationLink(
        destination: HabitDetailsView(habit: habit, habits: habits)
          .navigationTitle("Details"),
        label: {
          HabitRow(habit: habit)
        })
    }
  }
}

struct HabitList_Preview: PreviewProvider {
  static var previews: some View {
    HabitList(habits: Habits())
  }
}
