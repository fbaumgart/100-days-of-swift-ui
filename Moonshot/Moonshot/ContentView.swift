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
  @State private var isShowingCrewNames = false
  private let crewNames = "Crew names"
  private let launchDates = "Launch dates"
  
  var body: some View {
    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)
          
          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            if isShowingCrewNames {
              Text(getCrewNames(for: mission))
            } else {
              Text(mission.formattedLaunchDate)
            }
            
          }
        }
      }
      .navigationBarTitle("Moonshot")
      .navigationBarItems(trailing: Button(isShowingCrewNames ? launchDates : crewNames, action: {
        isShowingCrewNames.toggle()
      }))
    }
  }
  
  private func getCrewNames(for mission: Mission) -> String {
    var crew = ""
    mission.crew.forEach { crewMember in
      astronauts.forEach { astronaut in
        if astronaut.id == crewMember.name {
          crew.append(astronaut.name + "\n")
        }
      }
    }
    return crew.trimmingCharacters(in: .newlines)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
