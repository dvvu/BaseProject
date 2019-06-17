//
//  DeivceExtensions.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

extension UIDevice {
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhone4 = "iPhone 4 or iPhone 4S"
        case iPhone5 = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhone6 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhone6Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhoneX = "iPhone X"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 1920, 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        default:
            return .unknown
        }
    }
}
