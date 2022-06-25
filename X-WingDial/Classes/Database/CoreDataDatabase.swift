//
//  CoreDataDatabase.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject: Storable {}

enum CoreDataError: Error {
    case invalidMemory(identifier: String?)
    case objectCouldNotBeParsed
}

final class CoreDataDatabase: DatabaseProtocol {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "XWingDB")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    lazy var managedContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    func writeSafely(_ block: (() throws -> Void)) throws {
        try managedContext.save()
        try block()
    }
}
