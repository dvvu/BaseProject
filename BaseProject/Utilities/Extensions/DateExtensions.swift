//
//  DateExtensions.swift
//  BestDealMedication
//
//  Created by Macbook on 1/16/19.
//  Copyright © 2019 company. All rights reserved.
//

import Foundation

extension Date {
    func getDateString(format:String) -> String {
        let calendar = NSCalendar.current
        
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = format
        dateFormater.calendar   = calendar
        
        return dateFormater.string(from: self)
    }
}
