//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Filip Baumgart on 01/05/2021.
//

import SwiftUI

struct Title: ViewModifier {
  func body(content: Content) -> some View {
          content
              .font(.largeTitle)
              .foregroundColor(.blue)
      }
}

extension View {
  func asTitle() -> some View {
    self.modifier(Title())
  }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .asTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
