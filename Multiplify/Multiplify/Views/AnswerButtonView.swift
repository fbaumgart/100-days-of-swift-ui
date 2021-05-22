//
//  AnswerButtonView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

import SwiftUI

struct AnswerButtonView: View {
  
  var number: String
  @State var color: Color
  var onButtonPress: (String) -> Void
  @State private var angle: Double = 0
  
  var body: some View {
    Button(action: {
      withAnimation {
        color = .yellow
        angle = 360
      }
      onButtonPress(number)
      color = .blue
    }, label: {
      Text(number)
        .foregroundColor(.white)
        .font(.largeTitle.weight(.black))
        .frame(width: 120, height: 120, alignment: .center)
        .animation(.easeIn)
    })
    .frame(width: 150, height: 150, alignment: .center)
    .background(color)
    .cornerRadius(20)
    .padding()
    .rotation3DEffect(
      Angle(degrees: angle),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
  }
}
