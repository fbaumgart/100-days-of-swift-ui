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
    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: Text("Detail view")) {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)
          
          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            Text(mission.formattedLaunchDate)
          }
        }
      }
      .navigationBarTitle("Moonshot")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
