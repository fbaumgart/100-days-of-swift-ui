//
//  Habits.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 02/07/2021.
//

import SwiftUI

final class Habits: ObservableObject {
  @Published var items = [Habit]()
}
