//
//  XWing.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/12/19.
//  Copyright © 2019 Diogo Autilio. All rights reserved.
//

import CoreData
import Foundation

@objc(XWing)
class XWing: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
         case factions
    }

    required convenience init(from decoder: Decoder) throws {

        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("cannot Retrieve context")
        }

        guard let entity = NSEntityDescription.entity(forEntityName: "XWing", in: managedObjectContext) else {
            fatalError("Failed to decode XWing")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.factions = try container.decode([Faction].self, forKey: .factions)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(factions, forKey: .factions)
    }
}

extension CodingUserInfoKey {
   static let context = CodingUserInfoKey(rawValue: "context")!
}
