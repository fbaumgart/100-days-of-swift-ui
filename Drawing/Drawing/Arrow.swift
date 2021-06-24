//
//  Arrow.swift
//  Drawing
//
//  Created by Filip Baumgart on 24/06/2021.
//

import SwiftUI

struct Arrow: Shape {
  
  var lineWidth: CGFloat = 20
  var animatableData: CGFloat {
    get { lineWidth }
    set { self.lineWidth = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.minX + lineWidth, y: rect.midY))
    path.addLine(to: CGPoint(x: rect.maxX - lineWidth, y: rect.midY))
    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addRect(CGRect(x: rect.midX - (lineWidth / 2),
                        y: rect.midY,
                        width: lineWidth,
                        height: 100))
    return path
  }
}
