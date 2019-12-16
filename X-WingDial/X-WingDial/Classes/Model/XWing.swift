//
//  XWing.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

struct XWing: Codable {
    let ships: Ships
}

struct Faction: Codable {
    let title: String
}

struct Ships: Codable {
    let rebelAlliance: [String: Faction]
    let galacticEmpire: [String: Faction]
    let scumAndVillainy: [String: Faction]
    let firstOrder: [String: Faction]
    let galacticRepublic: [String: Faction]
    let resistance: [String: Faction]
    let separatistAlliance: [String: Faction]

    enum CodingKeys: String, CodingKey {
        case rebelAlliance = "rebel-alliance"
        case galacticEmpire = "galactic-empire"
        case scumAndVillainy = "scum-and-villainy"
        case firstOrder = "first-order"
        case galacticRepublic = "galactic-republic"
        case resistance
        case separatistAlliance = "separatist-alliance"
    }
}
