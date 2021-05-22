//
//  AnswerButtonView.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

import SwiftUI

struct AnswerButtonView: View {
  
  var number: String
  var color: Color
  
  var body: some View {
    Button(action: {
      
    }, label: {
      Text(number)
        .foregroundColor(.white)
        .font(.largeTitle.weight(.black))
        .frame(width: 120, height: 120, alignment: .center)
    })
    .frame(width: 150, height: 150, alignment: .center)
    .background(color)
    .cornerRadius(20)
    .padding()
  }
}
