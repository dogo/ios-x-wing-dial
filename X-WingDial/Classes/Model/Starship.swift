//
//  Starship.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation
import UIKit

struct Starship: Codable {
    let name: String
    let xws: String
    let size: String
    let dial: [String]
    let faction: String
    let stats: [Stat]
    let actions: [Action]
    let icon: URL?
    let pilots: [Pilot]
}

struct Action: Codable {
    let difficulty: ActionDifficulty
    let type: ActionType
    let linked: Linked?
}

struct Linked: Codable {
    let difficulty: ActionDifficulty
    let type: ActionType
}

struct Pilot: Codable {
    let name: String
    let caption: String?
    let initiative: Int
    let limited: Int
    let xws: String
    let ability: String?
    let shipAbility: ShipAbility?
    let slots: [String]?
    let hyperspace: Bool
}

struct ShipAbility: Codable {
    let name: String
    let text: String
}

enum ActionDifficulty: String, Codable {
    case purple = "Purple"
    case red = "Red"
    case white = "White"

    var tintColor: UIColor {
        switch self {
        case .purple:
            return UIColor.purple
        case .red:
            return UIColor.red
        case .white:
            return UIColor.white
        }
    }
}

enum ActionType: String, Codable {
    case barrelRoll = "Barrel Roll"
    case boost = "Boost"
    case calculate = "Calculate"
    case cloak = "Cloak"
    case coordinate = "Coordinate"
    case evade = "Evade"
    case focus = "Focus"
    case jam = "Jam"
    case lock = "Lock"
    case reinforce = "Reinforce"
    case reload = "Reload"
    case rotateArc = "Rotate Arc"
    case slam = "Slam"
}
