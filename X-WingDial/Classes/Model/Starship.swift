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

    enum ActionDifficulty: String, Codable {
        case white = "White"
        case red = "Red"

        var color: UIColor {
            switch self {
            case .white:
                return UIColor.white
            case .red:
                return UIColor.red
            }
        }
    }

    enum ActionType: String, Codable {
        case focus = "Focus"
        case lock = "Lock"
        case barrelRoll = "Barrel Roll"
        case evade = "Evade"
        case reinforce = "Reinforce"
        case boost = "Boost"
        case slam = "SLAM"
        case rotateArc = "Rotate Arc"
        case reload = "Reload"
        case jam = "Jam"
        case coordinate = "Coordinate"
        case cloak = "Cloak"
        case calculate = "Calculate"

        var icon: String {
            switch self {
            case .focus:
                return "f"
            case .lock:
                return "l"
            case .barrelRoll:
                return "r"
            case .evade:
                return "e"
            case .reinforce:
                return "i"
            case .boost:
                return "b"
            case .slam:
                return "s"
            case .rotateArc:
                return "R"
            case .reload:
                return "="
            case .jam:
                return "j"
            case .coordinate:
                return "o"
            case .cloak:
                return "k"
            case .calculate:
                return "a"
            }
        }
    }
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

struct Stat: Codable {
    let arc: String?
    let type: String
    let value: Int
}
