//
//  GameVariant.swift
//  Multiplify
//
//  Created by Filip Baumgart on 22/05/2021.
//

enum GameVariant: String, CaseIterable {
  case five, ten, twenty, all
  
  var toInt: Int {
    switch self {
    case .five: return 5
    case .ten: return 10
    case .twenty: return 20
    case .all: return 100
    }
  }
  
  static func from(string: String) -> Self {
    if string == "5" {
      return .five
    }
    if string == "10" {
      return .ten
    }
    if string == "20" {
      return .twenty
    }
    if string == "All" {
      return .all
    }
    return .five
  }
}
