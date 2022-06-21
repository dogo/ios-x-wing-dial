//
//  Faction.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 18/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation
import CoreData

@objc(Faction)
class Faction: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
         case name
         case icon
         case path
         case ships
     }

    required convenience init(from decoder: Decoder) throws {

        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("cannot Retrieve context")
        }

        guard let entity = NSEntityDescription.entity(forEntityName: "Faction", in: managedObjectContext) else {
            fatalError("Failed to decode Faction")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.icon = try container.decode(URL.self, forKey: .icon)
        self.path = try container.decode(String.self, forKey: .path)
        self.ships = try container.decode([Ship].self, forKey: .ships)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(icon, forKey: .icon)
        try container.encode(path, forKey: .path)
        try container.encode(ships, forKey: .ships)
    }
}
