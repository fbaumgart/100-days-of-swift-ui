//
//  AstronautView.swift
//  Moonshot
//
//  Created by Filip Baumgart on 05/06/2021.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  let missions: [Mission]
  
  init(astronaut: Astronaut) {
    self.astronaut = astronaut
    let allMissions: [Mission] = Bundle.main.decode("missions.json")
    self.missions = allMissions.filter { mission in
      mission.crew.first { crewMember in
        crewMember.name == astronaut.id
      } != nil
    }
  }
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        VStack {
          Image(self.astronaut.id)
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width)
          
          Text(self.astronaut.description)
            .padding()
          
          Text("Missions:")
            .bold()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
          
          VStack(alignment: .leading) {
            ForEach(missions, id: \.id) { mission in
              HStack {
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
              .padding(.leading, 10)
            }
          }.frame(maxWidth: .infinity, alignment: .leading)
        }
      }
    }
    .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
  }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    AstronautView(astronaut: astronauts[0])
  }
}
