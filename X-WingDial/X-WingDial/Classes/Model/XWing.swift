//
//  XWing.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

struct XWing: Codable {
    let factions: [Faction]
}

struct Faction: Codable, Hashable {
    let name: String
    let icon: URL
    let ships: [Ship]

    static func == (lhs: Faction, rhs: Faction) -> Bool {
          return lhs.name == rhs.name
      }

      func hash(into hasher: inout Hasher) {
          hasher.combine(name)
      }
}

struct Ship: Codable {
    let path: String
    let title: String
}
