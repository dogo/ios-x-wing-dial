//
//  Starship.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

struct Starship: Codable {
    let name: String
    let xws: String
    let size: String
    let dial: [String]
    let faction: String
    let stats: [Stat]
    let actions: [Action]
    let icon: String
    let pilots: [Pilot]
}

struct Action: Codable {
    let difficulty: String
    let type: String
}

struct Pilot: Codable {
    let name: String
    let caption: String
    let initiative: Int
    let limited: Int
    let xws, ability: String
    let shipAbility: ShipAbility
    let slots: [String]
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

