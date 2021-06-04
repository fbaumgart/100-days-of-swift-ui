//
//  Mission.swift
//  Moonshot
//
//  Created by Filip Baumgart on 04/06/2021.
//

struct Mission: Codable, Identifiable {
  struct CrewRole: Codable {
    let name: String
    let role: String
  }
  
  let id: Int
  let launchDate: String?
  let crew: [CrewRole]
  let description: String
}
