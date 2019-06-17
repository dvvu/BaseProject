//
//  Item.swift
//  BaseProject
//
//  Created by Macbook on 6/13/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import Foundation
import SwiftyJSON

class Item {
    var keyword: String
    var icon: String
    
    init(keyword: String, icon: String) {
        self.keyword = keyword
        self.icon    = icon
    }
    
    func parser(data: JSON) {
        self.keyword  = data["keyword"].stringValue
        self.icon     = data["icon"].stringValue
    }
    
    init(data: JSON) {
        self.keyword  = data["keyword"].stringValue
        self.icon     = data["icon"].stringValue
    }
}
