//
//  CoreDataPersistence.swift
//  DadJokes
//
//  Created by George Nyakundi on 22/02/2022.
//

import Foundation
import CoreData

class CoreDataPersistence: Persistence {
    func save(joke: Jke) {
        // TODO: Implement me
    }
    
    func fetch(withId id: String) {
        // TODO: Implement me
    }
    private var managedContext: NSExtensionContext?
    private var joke: Jke?
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JokesModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                // TODO: Remove me please
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
