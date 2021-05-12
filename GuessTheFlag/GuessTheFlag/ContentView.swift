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
  @State private var correctFlagTapped = false
  @State private var wrongFlagOpacity = 1.0
  @State private var animationAmount = 0.0
  
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
              .animation(correctAnswer == number ? .easeOut : nil)
              .opacity(correctAnswer == number ? 1 : wrongFlagOpacity)
              .transition(correctAnswer == number ? .identity : .opacity)
              .rotation3DEffect(
                .degrees(correctAnswer == number ? animationAmount : .zero),
                axis: (x: 0.0, y: 1.0, z: 0.0)
              )
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
      playerScore += 10
      wrongFlagOpacity -= 0.75
      withAnimation {
          self.animationAmount += 360
      }
      alertMessage = Text("Your score is \(playerScore)")
      correctFlagTapped = true
    } else {
      scoreTitle = "Wrong"
      alertMessage = Text("That's the flag of \(countries[number])!")
      playerScore -= 10
      wrongFlagOpacity -= 0.75
      correctFlagTapped = false
    }
    
    showingScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    wrongFlagOpacity = 1
    animationAmount = 0
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
