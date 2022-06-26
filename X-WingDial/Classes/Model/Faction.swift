//
//  Faction.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 18/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation

struct Faction: Codable, Hashable {
    let name: String
    let icon: URL
    let path: String
    let ships: [Ship]

    static func == (lhs: Faction, rhs: Faction) -> Bool {
          return lhs.path == rhs.path
      }

      func hash(into hasher: inout Hasher) {
          hasher.combine(path)
      }
}
