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
  
  var toString: String {
    self != .all ? String(toInt) : "All"
  }
  
  static func from(string: String) -> Self {
    switch string {
    case "5": return .five
    case "10": return .ten
    case "20": return .twenty
    case "All": return .all
    default: return .five
    }
  }
}
