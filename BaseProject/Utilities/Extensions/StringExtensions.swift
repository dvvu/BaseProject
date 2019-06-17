//
//  StringExtensions.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

extension String {
    
    func isValidEmail() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        
        // at least one uppercase, // "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{6,}"
        // at least one digit                            "(?=.*[0-9])(?=.*[a-z]).{8,}"
        // at least one lowercase
        // 8 characters total
        //(?=.*[!@#$&*])
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: self)
        //        return self.count > 5 ? true: false
    }
    
    func isValidField()-> Bool {
        
        return self.count > 0 ? true: false
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func getTimeInterval(dateFormat:String) -> TimeInterval {
        let calendar = NSCalendar.current
        
        let dateFormater = DateFormatter.init()
        dateFormater.dateFormat = dateFormat
        dateFormater.calendar   = calendar
        
        return (dateFormater.date(from: self) ?? Date())!.timeIntervalSince1970
    }
    
    func getTimeIntervalDefaultFormat() -> TimeInterval {
        return self.getTimeInterval(dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    func lastLetter() -> String {
        guard let lastChar = self.last else {
            return ""
        }
        return String(lastChar)
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}


extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}


