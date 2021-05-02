//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Filip Baumgart on 02/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  let options = GameMove.allCases
  @State private var appOption = Int.random(in: 0...2)
  @State private var shouldWin = Bool.random()
  @State private var playerScore = 0
  @State private var turnsCounter = 1
  @State private var showingScore = false
  
  var body: some View {
    VStack {
      Section {
        VStack {
          Text("Player score: \(playerScore)")
          Text("App move: \(options[appOption].rawValue)")
            .padding()
          if shouldWin {
            Text("Player move: win")
          } else {
            Text("Player move: lose")
          }
        }
      }
      
      Section {
        VStack {
          ForEach(0 ..< options.count) { number in
            Button(options[number].rawValue) {
              verify(playerChoice: number)
              if turnsCounter == 10 {
                showingScore = true
              } else {
                setupNewRound()
              }
            }
            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Capsule())
            .foregroundColor(.blue)
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .padding()
            .alert(isPresented: $showingScore, content: {
              Alert(title: Text("Game over"),
                    message: Text("You have scored \(playerScore) points"), dismissButton: .default(Text("Play Again")) {
                resetGame()
              })
            })
          }
        }
      }
    }
  }
  
  private func resetGame() {
    turnsCounter = 0
    playerScore = 0
    setupNewRound()
  }
  
  private func verify(playerChoice: Int) {
    if shouldWin {
      if options[playerChoice].winsAgainst(options[appOption]) {
        playerWon()
      } else {
        playerLose()
      }
    } else {
      if options[playerChoice].losesAgainst(options[appOption]) {
        playerWon()
      } else {
        playerLose()
      }
    }
  }
  
  private func setupNewRound() {
    appOption = Int.random(in: 0...2)
    shouldWin = Bool.random()
    turnsCounter += 1
  }
  
  private func playerWon() {
    playerScore += 1
  }
  
  private func playerLose() {
    playerScore -= 1
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

enum GameMove: String, CaseIterable {
  case rock, paper, scissors
  
  func winsAgainst(_ move: GameMove) -> Bool {
    switch self {
    case .paper: return move == .rock
    case .rock: return move == .scissors
    case .scissors: return move == .paper
    }
  }
  
  func losesAgainst(_ move: GameMove) -> Bool {
    switch self {
    case .paper: return move == .scissors
    case .rock: return move == .paper
    case .scissors: return move == .rock
    }
  }
}
