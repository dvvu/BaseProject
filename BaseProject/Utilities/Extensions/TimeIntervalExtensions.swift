//
//  TimeIntervalExtensions.swift
//  BestDealMedication
//
//  Created by Macbook on 1/16/19.
//  Copyright © 2019 company. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func getDateStringFrom(dateFormat: String) -> String {
        let calendar = NSCalendar.current
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = dateFormat
        dateFormater.calendar   = calendar
        let date = Date(timeIntervalSince1970: self)
        
        return dateFormater.string(from: date)
    }
}
