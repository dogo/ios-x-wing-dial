//
//  CoreDataDatabase+Operations.swift
//  X-WingDial
//
//  Created by Diogo Autilio on 16/01/20.
//  Copyright © 2020 Diogo Autilio. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataDatabase {

    func create<T: Storable>(_ model: T.Type, completion: @escaping ((T) -> Void)) throws {
        guard let storable = model as? NSManagedObject.Type else {
            throw CoreDataError.objectCouldNotBeParsed
        }

        try self.writeSafely { [weak self] in
            guard let self = self else { return }
            let entity = NSEntityDescription.entity(forEntityName: String(describing: storable), in: self.managedContext)!
            if let newObject = NSManagedObject(entity: entity, insertInto: self.managedContext) as? T {
                completion(newObject)
            }
        }
    }

    func save(object: Storable) throws {
        guard let storable = object as? NSManagedObject else {
            throw CoreDataError.objectCouldNotBeParsed
        }

        try self.writeSafely { [weak self] in
//            self?.realm.add(storable)
        }
    }

    func update(block: @escaping () -> Void) throws {
        try self.writeSafely {
            block()
        }
    }

    func delete(object: Storable) throws {
        guard let storable = object as? NSManagedObject else {
            throw CoreDataError.objectCouldNotBeParsed
        }

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: storable))
        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur3")

        let test = try managedContext.fetch(fetchRequest)
        let objectToDelete = test[0] as! NSManagedObject // swiftlint:disable:this force_cast

        try self.writeSafely { [weak self] in
            self?.managedContext.delete(objectToDelete)
        }
    }

    func deleteAll<T: Storable>(_ model: T.Type) throws {
        guard let storable = model as? NSManagedObject.Type else {
            throw CoreDataError.objectCouldNotBeParsed
        }

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: storable))
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        try self.writeSafely { [weak self] in
            try self?.managedContext.execute(deleteRequest)
        }
    }

    func reset() throws {
        try self.writeSafely { [weak self] in
//            self?.realm.deleteAll()
        }
    }

    func fetch<T: Storable>(_ model: T.Type,
                            predicate: NSPredicate? = nil,
                            sorted: Sorted? = nil,
                            completion: (([T]) -> Void)) throws {
        guard let storable = model as? NSManagedObject.Type else {
            throw CoreDataError.objectCouldNotBeParsed
        }

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: storable))

        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }

        if let sorted = sorted {
            let indexSort = NSSortDescriptor(key: sorted.key, ascending: sorted.ascending)
            fetchRequest.sortDescriptors = [indexSort]
        }

        let results = try managedContext.fetch(fetchRequest) as? [T]
        let storeables: [T] = results?.compactMap { $0 } ?? []
        completion(storeables)
    }
}
