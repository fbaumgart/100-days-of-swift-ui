//
//  ContentView.swift
//  Moonshot
//
//  Created by Filip Baumgart on 03/06/2021.
//

import SwiftUI

struct ContentView: View {
  
  private let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  private let missions: [Mission] = Bundle.main.decode("missions.json")
  
  var body: some View {
    Text("\(astronauts.count)")
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
