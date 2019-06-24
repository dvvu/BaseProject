//
//  BaseMO.swift
//  BaseProject
//
//  Created by Macbook on 6/21/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import CoreData

// this have all name off colum
enum BaseMOAttributes: String {
    case
    entityName = "User", // name off entity
    id = "id",
    title = "title",
    date = "date"
    
    static let getAll = [
        id,
        title,
        date,
        ]
}

@objc(BaseMO)

class BaseMO: NSManagedObject {
    @NSManaged var id: String?
    @NSManaged var title: String?
    @NSManaged var date: Date?
    
    convenience init(id: String, title: String, date: Date) {
//        let entity = NSEntityDescription.entity(forEntityName: BaseMOAttributes.entityName.rawValue, in: EventAPI.sharedInstance.mainContextInstance)
//        self.init(entity: entity!, insertInto: EventAPI.sharedInstance.mainContextInstance)
        self.init(context: EventAPI.sharedInstance.mainContextInstance)
        self.id = id
        self.title = title
        self.date = date
    }
}
