//
//  Ship.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 18/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation
import CoreData

@objc(Ship)
class Ship: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
         case path
         case title
     }

    required convenience init(from decoder: Decoder) throws {

        guard let managedObjectContext = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("cannot Retrieve context")
        }

        guard let entity = NSEntityDescription.entity(forEntityName: "Ship", in: managedObjectContext) else {
            fatalError("Failed to decode Ship")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.path = try container.decode(String.self, forKey: .path)
        self.title = try container.decode(String.self, forKey: .title)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(path, forKey: .path)
        try container.encode(title, forKey: .title)
    }
}
