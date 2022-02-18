//
//  CoreDataService.swift
//  SwiftUIVersionTestProject
//
//  Created by Kolesnikov Dmitry on 18.02.2022.
//

import CoreData

protocol CoreDataServing {
    func saveNewObeject<T: NSManagedObject>(
        by type: T.Type,
        completion: @escaping ((T)->())
    )
    
    func fetchObject<T: NSManagedObject>(by type: T.Type) -> [T]?
}

final class CoreDataService: CoreDataServing {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SwiftUITestProject")
        container.loadPersistentStores { _, error in
            guard let error = error else {
                return
            }
            fatalError("Unresolved error \(error), \(error.localizedDescription)")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    func saveNewObeject<T: NSManagedObject>(
        by type: T.Type,
        completion: @escaping ((T)->())
    ) {
        let newItem = type.init(context: persistentContainer.viewContext)
        completion(newItem)
        do {
            try persistentContainer.viewContext.save()
        } catch let nserror {
            fatalError("Unresolved error \(nserror), \(nserror.localizedDescription)")
        }
    }
    
    func fetchObject<T: NSManagedObject>(by type: T.Type) -> [T]? {
        let context = persistentContainer.viewContext
        do {
            return try context.fetch(type.fetchRequest()) as? [T]
        } catch let fetchError {
            fatalError("Unresolved error \(fetchError), \(fetchError.localizedDescription)")
        }
    }
    
}
