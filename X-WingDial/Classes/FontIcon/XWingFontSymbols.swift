//
//  XWingFontSymbols.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 06/08/22.
//  Copyright © 2022 Diogo Autilio. All rights reserved.
//

import Foundation

extension SpecialAttribute {

    var symbol: String {
        switch self {
        case .evade:
            return "e"
        case .focus:
            return "f"
        case .criticalHit:
            return "c"
        case .barrelRoll:
            return "r"
        case .boost:
            return "b"
        case .frontArc:
            return "{"
        case .leftArc:
            return "£"
        case .rightArc:
            return "¢"
        case .rearArc:
            return "|"
        case .fullFrontArc:
            return "~"
        case .fullRearArc:
            return "¡"
        case .turret:
            return "U"
        case .hit:
            return "d"
        case .force:
            return "h"
        case .bullseyeArc:
            return "}"
        case .coordinate:
            return "o"
        case .configuration:
            return "n"
        case .charge:
            return "g"
        case .lock:
            return "l"
        case .talent:
            return "E"
        case .missile:
            return "M"
        case .straight:
            return "8"
        case .bankLeft:
            return "7"
        case .bankRight:
            return "9"
        case .torpedo:
            return "P"
        case .reload:
            return "="
        case .koiogranTurn:
            return "2"
        case .calculate:
            return "a"
        case .segnorsLoopLeft:
            return "1"
        case .segnorsLoopRight:
            return "3"
        case .turnLeft:
            return "4"
        case .turnRight:
            return "6"
        case .cannon:
            return "C"
        case .singleTurretArc:
            return "p"
        case .rotateArc:
            return "R"
        case .astromech:
            return "A"
        case .tallonRollLeft:
            return ":"
        case .tallonRollRight:
            return ";"
        case .slam:
            return "s"
        case .unknown:
            return "PANDA"
        }
    }
}

extension Action.`Type` {

    var symbol: String {
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

extension Stat.`Type` {

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
}

extension Stat.Arc {

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
