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
    VStack {
      Section {
        Text(habit.name)
          .font(.headline)
        Text(habit.description)
          .font(.subheadline)
      }
      
    }
  }
}
