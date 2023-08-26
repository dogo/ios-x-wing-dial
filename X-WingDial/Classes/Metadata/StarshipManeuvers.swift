//
//  StarshipManeuvers.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 06/08/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation
import UIKit

struct StarshipDial {

    let dial: Maneuvers

    init(_ maneuver: String) {
        let movements = Array(maneuver.dropFirst()).map { "\($0)" }
        dial = Maneuvers(maneuver: StarshipManeuvers(fromRawValue: movements[0]),
                         difficulty: StarshipMoveDifficulty(fromRawValue: movements[1]))
    }
}

struct Maneuvers {

    let maneuver: StarshipManeuvers
    let difficulty: StarshipMoveDifficulty
}

enum StarshipManeuvers: String, CaseIterable {
    case reverseBankLeft = "A"
    case reverseBankRight = "D"
    case reverseStraight = "S"
    case tallonRollLeft = "E"
    case tallonRollRight = "R"
    case segnorLoopRight = "P"
    case segnorLoopLeft = "L"
    case turnLeft = "T"
    case bankLeft = "B"
    case stationary = "O"
    case bankRight = "N"
    case turnRight = "Y"
    case straight = "F"
    case koiogran = "K"
    case unknown

    init(fromRawValue: String) {
        self = StarshipManeuvers(rawValue: fromRawValue) ?? .unknown
    }
}

enum StarshipMoveDifficulty: String, CaseIterable {
    case easy = "B"
    case hard = "R"
    case regular = "W"
    case unknown

    init(fromRawValue: String) {
        self = StarshipMoveDifficulty(rawValue: fromRawValue) ?? .unknown
    }

    var tintColor: UIColor {
        switch self {
        case .easy:
            return .blue
        case .hard:
            return .red
        case .regular:
            return .white
        default:
            return .purple
        }
    }
}
