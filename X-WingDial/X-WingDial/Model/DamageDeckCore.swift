//
//  DamageDeckCore.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

struct DamageDeckCore: Codable {

    let name: String
    let xws: String
    let ffg: Int
    let size: String
    let dial: [String]
    let faction: String
    let stats: [Stat]
    let actions: [Action]
    let icon: String
    let pilots: [Pilot]
}
