//
//  CoreDataBaseAPI.swift
//  BaseProject
//
//  Created by Macbook on 6/21/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import CoreData

class CoreDataBaseAPI: EventAPI, APIProtocol {
    
    private let entityName = BaseMOAttributes.entityName.rawValue
    
    func getObjectsWithCondition(_ condition: NSPredicate) -> Array<Any> {
        var fetchedResults: Array<BaseMO> = Array<BaseMO>()
        
        // Create request on Event entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = condition
        
        //Execute Fetch request
        do {
            fetchedResults = try self.mainContextInstance.fetch(fetchRequest) as! [BaseMO]
        } catch let fetchError as NSError {
            print("retrieveById error: \(fetchError.localizedDescription)")
            fetchedResults = Array<BaseMO>()
        }
        
        return fetchedResults
    }
    
    func deleteObject(_ item: NSManagedObject) {
        //Delete event item from persistance layer
        self.mainContextInstance.delete(item)
        
        //Save and merge changes from Minion workers with Main context
        self.persistenceManager.mergeWithMainContext()
    }
    
    func updateObject(_ itemToUpdate: NSManagedObject, newEventItemDetails: [String : Any]) {
        let minionManagedObjectContextWorker: NSManagedObjectContext =
            NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        minionManagedObjectContextWorker.parent = self.mainContextInstance
        
        //Assign field values
        for (key, value) in newEventItemDetails {
            for attribute in BaseMOAttributes.getAll {
                if (key == attribute.rawValue) {
                    itemToUpdate.setValue(value, forKey: key)
                }
            }
        }
        
        //Persist new Event to datastore (via Managed Object Context Layer).
        self.persistenceManager.saveWorkerContext(minionManagedObjectContextWorker)
        self.persistenceManager.mergeWithMainContext()
    }
    
    func saveObject(_ item: NSManagedObject) {
        if item is BaseMO {
            let minionManagedObjectContextWorker: NSManagedObjectContext =
                NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
            minionManagedObjectContextWorker.parent = self.mainContextInstance
            
            //Create new Object of Event entity
//            eventItem = NSEntityDescription.insertNewObject(forEntityName: entityName, into: minionManagedObjectContextWorker) as! BaseMO
            
            //Save current work on Minion workers
            self.persistenceManager.saveWorkerContext(minionManagedObjectContextWorker)
            
            //Save and merge changes from Minion workers with Main context
            self.persistenceManager.mergeWithMainContext()
        }
    }
   
    func getAllObjects(_ sortedByDate: Bool = true, sortAscending: Bool = true) -> Array<Any> {
        var fetchedResults: Array<BaseMO> = Array<BaseMO>()
        // Create request on Event entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        //Create sort descriptor to sort retrieved Events by Date, ascending
        if sortedByDate {
            let sortDescriptor = NSSortDescriptor(key: BaseMOAttributes.date.rawValue, ascending: sortAscending)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
        }
        //Execute Fetch request
        do {
            fetchedResults = try self.mainContextInstance.fetch(fetchRequest) as! [BaseMO]
        } catch let fetchError as NSError {
            print("retrieveById error: \(fetchError.localizedDescription)")
            fetchedResults = Array<BaseMO>()
        }
        
        return fetchedResults
    }
    
    func deleteAllObjects() {
        let retrievedItems = getAllObjects()
        
        //Delete all event items from persistance layer
        for item in retrievedItems {
            self.mainContextInstance.delete(item as! NSManagedObject)
        }
        
        //Save and merge changes from Minion workers with Main context
        self.persistenceManager.mergeWithMainContext()
    }
}
