//
//  SpecialAttribute.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 06/08/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

enum SpecialAttribute: String, CaseIterable {
    case astromech = "[Astromech]"
    case bankLeft = "[Bank Left]"
    case bankRight = "[Bank Right]"
    case barrelRoll = "[Barrel Roll]"
    case boost = "[Boost]"
    case bullseyeArc = "[Bullseye Arc]"
    case calculate = "[Calculate]"
    case cannon = "[Cannon]"
    case charge = "[Charge]"
    case configuration = "[Configuration]"
    case coordinate = "[Coordinate]"
    case criticalHit = "[Critical Hit]"
    case evade = "[Evade]"
    case focus = "[Focus]"
    case force = "[Force]"
    case frontArc = "[Front Arc]"
    case fullFrontArc = "[Full Front Arc]"
    case fullRearArc = "[Full Rear Arc]"
    case hit = "[Hit]"
    case koiogranTurn = "[Koiogran Turn]"
    case leftArc = "[Left Arc]"
    case lock = "[Lock]"
    case missile = "[Missile]"
    case rearArc = "[Rear Arc]"
    case reload = "[Reload]"
    case rightArc = "[Right Arc]"
    case rotateArc = "[Rotate Arc]"
    case segnorsLoopLeft = "[Segnor's Loop Left]"
    case segnorsLoopRight = "[Segnor's Loop Right]"
    case singleTurretArc = "[Single Turret Arc]"
    case slam = "[Slam]"
    case straight = "[Straight]"
    case talent = "[Talent]"
    case tallonRollLeft = "[Tallon Roll Left]"
    case tallonRollRight = "[Tallon Roll Right]"
    case torpedo = "[Torpedo]"
    case turnLeft = "[Turn Left]"
    case turnRight = "[Turn Right]"
    case turret = "[Turret]"
    case unknown

    init(fromRawValue: String) {
        self = SpecialAttribute(rawValue: fromRawValue) ?? .unknown
    }
}
