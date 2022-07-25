//
//  StarshipStat.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/07/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation
import UIKit

struct Stat: Codable {

    let arc: ArcType?
    let type: StatType
    let value: Int

    enum StatType: String, Codable {
        case attack
        case agility
        case hull
        case shields

        var symbol: String {
            switch self {
            case .attack:
                return "%"
            case .agility:
                return "^"
            case .hull:
                return "&"
            case .shields:
                return "*"
            }
        }

        var tintColor: UIColor {
            switch self {
            case .attack:
                return UIColor.red
            case .agility:
                return UIColor.green
            case .hull:
                return UIColor.yellow
            case .shields:
                return UIColor.blue
            }
        }
    }

    enum ArcType: String, Codable {
        case frontArc = "Front Arc"
        case rearArc = "Rear Arc"
        case bullseyeArc = "Bullseye Arc"
        case singleTurretArc = "Single Turret Arc"
        case doubleTurretArc = "Double Turret Arc"
        case fullFrontArc = "Full Front Arc"
        case fullRearArc = "Full Rear Arc"

        var symbol: String {
            switch self {
            case .frontArc:
                return "{"
            case .rearArc:
                return "|"
            case .bullseyeArc:
                return "}"
            case .singleTurretArc:
                return "p"
            case .doubleTurretArc:
                return "q"
            case .fullFrontArc:
                return "~"
            case .fullRearArc:
                return "¡"
            }
        }
    }
}
