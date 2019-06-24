//
//  APIProtocol.swift
//  BaseProject
//
//  Created by Macbook on 6/21/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import CoreData

protocol APIProtocol {
    func saveObject(_ item: NSManagedObject)
    func updateObject(_ itemToUpdate: NSManagedObject, newEventItemDetails: [String : Any])
    func deleteObject(_ item: NSManagedObject)
    func deleteAllObjects()
    func getAllObjects(_ sortedByDate: Bool, sortAscending: Bool) -> Array<Any>
    func getObjectsWithCondition(_ condition: NSPredicate) -> Array<Any>
}
