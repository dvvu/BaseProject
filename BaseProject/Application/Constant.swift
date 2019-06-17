//
//  Constant.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
import UIKit

class APP_COLOR {
    static var colors = ["16702e", "005a51", "996c00", "5c0a6b", "006d90", "974e06", "99272e", "89221f", "00345d"]
}

class APP_FONT {
    static func font() -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
}

class KEY_API {
    static var baseURL = "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios"
    static let search  = "\(KEY_API.baseURL)/keywords.json"
}


class CONSTANT {
    static var keyLanguage = "language"
    static var keyToken = "token"
}

class NOTIFICATION_NAME {
    // server business
    static let invalidToken = NSNotification.Name(rawValue: "NTF_INVALID_TOKEN")
    static let internetConnectionFaild = NSNotification.Name(rawValue: "NTF_INTERNET_CONNECTION_FAILD")
    static let retryAPI = NSNotification.Name(rawValue: "NTF_RETRY_API")
    // app local
    static let localize = NSNotification.Name(rawValue: "NTF_LOCALIZE")
    static let updateCoreData = NSNotification.Name(rawValue: "NTF_UPDATE_CORE_DATA")
    static let updateCoreDataEventDetail = NSNotification.Name(rawValue: "NTF_UPDATE_CORE_DATA_EVENT_DETAIL")
    static let updateFolderImage = NSNotification.Name(rawValue: "NTF_UPDATE_FOLDER_IMAGE")
}

class ERROR_CODE {
    static let invalidToken = 401
    static let notConnection = -1009
}
