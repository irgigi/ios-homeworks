//
//  CoreDataService.swift
//  Navigation

import Foundation
import CoreData

protocol ICoreDataService {
    
    var context: NSManagedObjectContext { get }
    func saveContext()
    
}

final class CoreDataService: ICoreDataService {
    
    static let shared: ICoreDataService = CoreDataService()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: .coreDataBaseName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error)
                //assertionFailure("load persistent stores error")
            }
        }
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("Данные успешно сохранены")
            } catch {
                print(error)
                assertionFailure("save error")
            }
        }
    }
}

private extension String {
    static let coreDataBaseName = "DataBase"
}
