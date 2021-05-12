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
  @State private var wrongFlagOpacity = 1.0
  @State private var playerAnswer = 3
  @State private var angle = 0.0
  
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
              .rotation3DEffect(
                .degrees((correctAnswer == number) && (number == playerAnswer) ? angle : .zero),
                axis: (x: 0.0, y: 1.0, z: 0.0)
              )
              .rotationEffect(Angle(degrees: (number == playerAnswer) && (number != correctAnswer) ? angle : 0))
              .animation((number == playerAnswer) && (number != correctAnswer) ? .interpolatingSpring(stiffness: 1000, damping: 5) : .default)
              .opacity(correctAnswer == number ? 1 : wrongFlagOpacity)
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
  
  private func flagTapped(_ number: Int) {
    playerAnswer = number
    wrongFlagOpacity -= 0.75
    let isAnswerCorrect = number == correctAnswer
    setScore(isAnswerCorrect)
    setAlertContent(isAnswerCorrect, tappedFlagName: countries[number])
    setAngleForAnimation(isAnswerCorrect)
    showingScore = true
  }
  
  private func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    wrongFlagOpacity = 1
    playerAnswer = 3
  }
  
  private func setAngleForAnimation(_ answerCorrect: Bool) {
    withAnimation {
      angle = answerCorrect ? 360 : 15
    }
    angle = 0
  }
  
  private func setScore(_ answerCorrect: Bool) {
    if answerCorrect {
      playerScore += 10
    } else {
      playerScore -= 10
    }
  }
  
  private func setAlertContent(_ answerCorrect: Bool, tappedFlagName: String) {
    if answerCorrect {
      scoreTitle = "Correct"
      alertMessage = Text("Your score is \(playerScore)")
    } else {
      scoreTitle = "Wrong"
      alertMessage = Text("That's the flag of \(tappedFlagName)!")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
