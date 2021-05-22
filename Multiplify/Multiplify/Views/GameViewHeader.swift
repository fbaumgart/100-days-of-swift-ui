//
//  GameViewHeader.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

import SwiftUI

struct GameViewHeader: View {
  
  var question: String
  
  var body: some View {
    Section {
      Text("What is:")
      Text(question)
        .font(.largeTitle)
        .bold()
    }
  }
}
