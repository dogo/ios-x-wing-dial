//
//  Ship+CoreDataProperties.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 25/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import CoreData
import Foundation

extension Ship {

    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Ship> {
        return NSFetchRequest<Ship>(entityName: "Ship")
    }

    @NSManaged var path: String
    @NSManaged var title: String
}
