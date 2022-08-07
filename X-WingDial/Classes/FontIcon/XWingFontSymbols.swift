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

extension ActionType {

    var symbol: String {
        switch self {
        case .focus:
            return "\u{0066}"
        case .linked:
            return "\u{003e}"
        case .lock:
            return "\u{006c}"
        case .barrelRoll:
            return "\u{0072}"
        case .evade:
            return "\u{0065}"
        case .reinforce:
            return "\u{0069}"
        case .boost:
            return "\u{0062}"
        case .slam:
            return "\u{0073}"
        case .rotateArc:
            return "\u{0052}"
        case .reload:
            return "\u{003d}"
        case .jam:
            return "\u{006a}"
        case .coordinate:
            return "\u{006f}"
        case .cloak:
            return "\u{006b}"
        case .calculate:
            return "\u{0061}"
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

extension StarshipManeuvers {

    var symbol: String {
        switch self {
        case .reverseBankLeft:
            return "J"
        case .reverseBankRight:
            return "L"
        case .reverseStraight:
            return "K"
        case .tallonRollLeft:
            return ":"
        case .tallonRollRight:
            return ";"
        case .segnorLoopLeft:
            return "1"
        case .segnorLoopRight:
            return "3"
        case .turnLeft:
            return "4"
        case .bankLeft:
            return "7"
        case .stationary:
            return "5"
        case .bankRight:
            return "9"
        case .turnRight:
            return "6"
        case .straight:
            return "8"
        case .koiogran:
            return "2"
        case .unknown:
            return "PANDA"
        }
    }
}

extension Slot {

    var symbol: String {
        switch self {
        case .astromech:
            return "\u{0041}"
        case .cannon:
            return "\u{0043}"
        case .cargo:
            return "\u{0047}"
        case .command:
            return "\u{0056}"
        case .configuration:
            return "\u{006e}"
        case .crew:
            return "\u{0057}"
        case .device:
            return "\u{0042}"
        case .forcePower:
            return "\u{0046}"
        case .gunner:
            return "\u{0059}"
        case .hardpoint:
            return "\u{0048}"
        case .hyperdrive:
            return "─"
        case .illicit:
            return "\u{0049}"
        case .missile:
            return "\u{004d}"
        case .modification:
            return "\u{006d}"
        case .sensor:
            return "\u{0053}"
        case .tacticalRelay:
            return "\u{005a}"
        case .talent:
            return "\u{0045}"
        case .team:
            return "\u{0054}"
        case .tech:
            return "\u{0058}"
        case .title:
            return "\u{0074}"
        case .torpedo:
            return "\u{0050}"
        case .turret:
            return "\u{0055}"
        case .unknown:
            return "PANDA"
        }
    }
}
