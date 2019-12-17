//
//  XWing.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

struct XWing: Codable {
    let ships: [Ship]
}

struct Ship: Codable {
    let path: String
    let title: String
    let faction: Faction
}

enum Faction: String, Codable {
    case firstOrder = "first-order"
    case galacticEmpire = "galactic-empire"
    case galacticRepublic = "galactic-republic"
    case rebelAlliance = "rebel-alliance"
    case resistance = "resistance"
    case scumAndVillainy = "scum-and-villainy"
    case separatistAlliance = "separatist-alliance"

    var name: String {
        return self.rawValue.capitalized.replacingOccurrences(of: "-", with: " ")
    }
}

