//
//  Pilot.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 14/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

struct Pilot: Codable {

    let name: String
    let caption: String
    let initiative: Int
    let limited: Int
    let cost: Int
    let xws, ability: String
    let image: String
    let slots: [String]
    let artwork: String
    let ffg: Int
    let hyperspace: Bool
}
