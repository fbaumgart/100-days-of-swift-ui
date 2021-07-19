//
//  Habit.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 01/07/2021.
//

import Foundation

struct Habit: Identifiable {
  var id = UUID()
  var name: String
  var description: String
  var activityCounter = 0
}
