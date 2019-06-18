//
//  File.swift
//  BestDealMedication
//
//  Created by Macbook on 1/18/19.
//  Copyright © 2019 company. All rights reserved.
//

import Foundation
import CoreData

class EventAPI {
    
    let persistenceManager: PersistenceManager!
    var mainContextInstance: NSManagedObjectContext!

    //Utilize Singleton pattern by instanciating EventAPI only once.
    class var sharedInstance: EventAPI {
        struct Singleton {
            static let instance = EventAPI()
        }
        
        return Singleton.instance
    }
    
    init() {
        self.persistenceManager = PersistenceManager.sharedInstance
        self.mainContextInstance = persistenceManager.getMainContextInstance()
    }
}
