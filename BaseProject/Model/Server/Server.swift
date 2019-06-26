//
//  Server.swift
//  BaseProject
//
//  Created by Macbook on 6/26/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import CoreData

// this have all name off colum
enum ServerMOAttributes: String {
    case
    entityName = "Server", // name off entity
    title = "title",
    host = "host"
    
    static let getAll = [
        title,
        host,
        ]
}

@objc(ServerMO)

class ServerMO: NSManagedObject {
    @NSManaged var title: String?
    @NSManaged var host: String?
    
    convenience init() {
        self.init(context: EventAPI.sharedInstance.mainContextInstance)
    }
}
