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

    let arc: Arc?
    let type: `Type`
    let value: Int

    enum `Type`: String, Codable {
        case attack
        case agility
        case hull
        case shields

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

    enum Arc: String, Codable {
        case frontArc = "Front Arc"
        case rearArc = "Rear Arc"
        case bullseyeArc = "Bullseye Arc"
        case singleTurretArc = "Single Turret Arc"
        case doubleTurretArc = "Double Turret Arc"
        case fullFrontArc = "Full Front Arc"
        case fullRearArc = "Full Rear Arc"
    }
}
