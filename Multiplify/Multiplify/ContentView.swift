//
//  ContentView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isGameRunning = false
  
  var body: some View {
    Group {
      VStack {
        if isGameRunning {
          GameView()
        } else {
          ConfigurationView()
        }
        Button("Toogle!") {
          isGameRunning.toggle()
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
