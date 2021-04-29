//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Filip Baumgart on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      Text("Your content")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
