//
//  LocalizeExtensions.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit
import Material

extension UILabel {
    @IBInspectable
    open var localize: String {
        get {
            return self.localize
        }
        set(value) {
            self.text = value.localized
        }
    }
}

extension UITextField {
    @IBInspectable
    open var localize: String {
        get {
            return self.localize
        }
        set(value) {
            self.placeholder = value.localized
        }
    }
}

//extension Button {
//    @IBInspectable
//    open var localize: String {
//        get {
//            return self.localize
//        }
//        set(value) {
//            self.title = value.localized
//        }
//    }
//}

extension UIButton {
    @IBInspectable
    open var localize: String {
        get {
            return self.localize
        }
        set(value) {

            self.setTitle(value.localized, for: .normal)
        }
    }
}
