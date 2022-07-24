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
    let difficulty: ActionType
    let type: String

    enum ActionType: String, Codable {
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
