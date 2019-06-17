//
//  NetworkManager.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    
    static let shareInstance = NetworkManager()
    var sessionManager = SessionManager()
    
    typealias SuccessHandler = (JSON) -> Void
    typealias FailureHandler = (Error) -> Void
    typealias SessionHandler = (Bool) -> Void
    typealias SuccessHotKey = ([ItemViewModel]) -> Void
    
    override init() {
        super.init()
        // configuration network
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        
        self.sessionManager = Alamofire.SessionManager(configuration: config)
    }
    
    private func getHeader(enableHeader: Bool) -> [String:String]? {
        if enableHeader {
            return ["Authorization": "Bearer " + Session.shared.token,
                    "api-version": "2.0",
                    "Content-Type": "application/json"]
        }
        
        return ["Content-Type": "application/json"]
    }
    
    private func processError(error:NSError) {
        if error.code == ERROR_CODE.invalidToken {
            NotificationCenter.default.post(name: NOTIFICATION_NAME.invalidToken, object: nil)
        }
    }
    
    private func internetConnectionFaild(error:NSError) {
        if error.code == ERROR_CODE.notConnection {
            NotificationCenter.default.post(name: NOTIFICATION_NAME.internetConnectionFaild, object: nil)
        }
    }
}
// using base -> call back json to controller
extension NetworkManager {
    func requestAPI(urlString:String, params: [String: Any]?, isShowLoader: Bool, method: HTTPMethod, enableHeader: Bool, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        
        if isShowLoader {
            HUDViewController.showLoading { (success) in}
        }
        self.sessionManager.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: self.getHeader(enableHeader: enableHeader)).responseJSON { (response) in
            HUDViewController.dismissLoading()
            if response.result.isSuccess {
                let json = JSON(response.result.value ?? "")
                success(json)
            } else {
                // network error
                let error:Error = response.result.error!
                self.internetConnectionFaild(error: error as NSError)
                failure(error)
            }
        }
    }
}

// request hot key
extension NetworkManager {
    func requestHotKeyword(urlString:String, params: [String: Any]?, isShowLoader: Bool, method: HTTPMethod, enableHeader: Bool, success: @escaping SuccessHotKey, failure: @escaping FailureHandler) {
        
        if isShowLoader {
            HUDViewController.showLoading { (success) in}
        }
        self.sessionManager.request(urlString, method: method, parameters: params, encoding: JSONEncoding.default, headers: self.getHeader(enableHeader: enableHeader)).responseJSON { (response) in
            HUDViewController.dismissLoading()
            if response.result.isSuccess {
                let json = JSON(response.result.value ?? "")
                let keywpords = json["keywords"].arrayValue
                var items: [ItemViewModel] = []
                for i in 0..<keywpords.count {
                    let item = Item(data: keywpords[i])
                    let itemModel = ItemViewModel(item: item)
                    itemModel.colorText = APP_COLOR.colors[i%APP_COLOR.colors.count]
                    items.append(itemModel)
                }
                success(items)
            } else {
                // network error
                let error:Error = response.result.error!
                self.internetConnectionFaild(error: error as NSError)
                failure(error)
            }
        }
    }
}
