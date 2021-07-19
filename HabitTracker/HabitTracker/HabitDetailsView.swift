//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 03/07/2021.
//

import SwiftUI

struct HabitDetailsView: View {
  
  @State var habit: Habit
  @ObservedObject var habits: Habits
  
  var body: some View {
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
        HStack {
          Text("Activity counter:")
          Text(String(habit.activityCounter))
            .font(.headline)
        }
        Button("Tap to confirm activity", action: {
          guard let habitIndex = habits.items
                  .firstIndex(where: { $0.id == self.habit.id }) else { return }
          habits.items.remove(at: habitIndex)
          var activityCount = habit.activityCounter
          activityCount += 1
          let habit = Habit(id: habit.id,
                            name: habit.name,
                            description: habit.description,
                            activityCounter: activityCount)
          habits.items.append(habit)
          self.habit.activityCounter += 1
        })
      }
    }
  }
}
