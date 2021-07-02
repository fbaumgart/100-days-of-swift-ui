//
//  ContentView.swift
//  HabitTracker
//
//  Created by Filip Baumgart on 01/07/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isShowingAddView = false
  
  var body: some View {
    NavigationView {
      HabitList()
        .navigationTitle("HabiTracker")
        .navigationBarItems(trailing: Button("Add", action: {
          isShowingAddView.toggle()
        }))
    }
    .sheet(isPresented: $isShowingAddView, content: {
      AddHabitView()
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
