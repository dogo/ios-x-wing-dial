//
//  SectionsBuilder.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

enum SectionsBuilder {

    static func factions(_ data: [Faction]) -> [Faction] {
        return data.compactMap { $0 }
    }
}
