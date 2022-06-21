//
//  Split.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 17/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import Foundation

enum Split {

    static func starshipsByFaction(_ factions: [Faction]) -> [Faction: [Ship]] {

        var tableViewSource = [Faction: [Ship]]()
        factions.forEach { tableViewSource[$0] = $0.ships }

        return tableViewSource
    }
}
