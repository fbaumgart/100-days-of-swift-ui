//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Filip Baumgart on 22/04/2021.
//

import SwiftUI

struct FlagImage: View {
  
  var country: String
  
  var body: some View {
    Image(country)
      .renderingMode(.original).clipShape(Capsule())
      .overlay(Capsule().stroke(Color.black, lineWidth: 1))
      .shadow(color: .black, radius: 2)
  }
}

struct ContentView: View {
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var playerScore = 0
  @State private var alertMessage = Text("")
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 30) {
        VStack {
          Text("Tap the flag of").foregroundColor(.white)
          Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle)
            .fontWeight(.black)
        }
        ForEach(0 ..< 3) { number in
          Button(action: {
            self.flagTapped(number)
          }) {
            FlagImage(country: countries[number])
          }
        }
        Spacer()
      }
    }
    .alert(isPresented: $showingScore) {
      Alert(title: Text(scoreTitle), message: alertMessage, dismissButton: .default(Text("Continue")) {
        self.askQuestion()
      })
    }
  }
  
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
      alertMessage = Text("Your score is \(playerScore)")
      playerScore += 10
    } else {
      scoreTitle = "Wrong"
      alertMessage = Text("That's the flag of \(countries[number])!")
      playerScore -= 10
    }
    
    showingScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
