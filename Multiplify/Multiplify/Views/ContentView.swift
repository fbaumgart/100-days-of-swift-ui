//
//  ContentView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isGameRunning = false
  @State private var firstNumber = 1
  @State private var secondNumber = 10
  @State private var chosenNumberOfQuestions = "All"
  
  private var game: Game {
    Game(firstNumber: firstNumber,
         secondNumber: secondNumber,
         gameVariant: GameVariant.from(string: chosenNumberOfQuestions))
  }
  
  var body: some View {
    NavigationView {
      Group {
        VStack {
          if isGameRunning {
            GameView(game: game)
          } else {
            
            Form {
              Section(header: Text("I want to mulitply:")) {
                Stepper(value: $firstNumber, in: 1...12, step: 1) {
                  Text("1st number up to : \(firstNumber)")
                }
                Stepper(value: $secondNumber, in: 1...12, step: 1) {
                  Text("2nd number up to: \(secondNumber)")
                }
              }
              Section(header: Text("How many questions?")) {
                Picker("Number of questions", selection: $chosenNumberOfQuestions) {
                  ForEach(GameVariant.allCases, id: \.self.toString) { number in
                    Text("\(number.toString)")
                  }
                }
              }
            }
            
          }
          if !isGameRunning {
            Button("Let's play!") {
              isGameRunning.toggle()
            }
            .frame(width: 200, height: 100, alignment: .center)
            .background(Color.red)
            .clipShape(Capsule())
            .font(.largeTitle)
            .foregroundColor(.white)
          }
        }
      }
      .navigationBarTitle("Multiplify!", displayMode: .large)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
