//
//  Faction+CoreDataProperties.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import CoreData
import Foundation

extension Faction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Faction> {
        return NSFetchRequest<Faction>(entityName: "Faction")
    }

    @NSManaged var name: String
    @NSManaged var icon: URL
    @NSManaged var path: String
    @NSManaged var ships: [Ship]
}
