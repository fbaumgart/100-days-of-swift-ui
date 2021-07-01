//
//  HabitRow.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 01/07/2021.
//

import SwiftUI

struct HabitRow: View {
  
  var habit: Habit
  
  var body: some View {
    VStack {
      Text("\(habit.name)")
        .font(.headline)
      Text("\(habit.description)")
        .font(.subheadline)
    }
  }
}

struct HabitRow_Previews: PreviewProvider {
  static var previews: some View {
    HabitRow(habit: .init(name: "test", description: "test"))
  }
}
