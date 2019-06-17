//
//  Localize.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation

class Localize {
    static let shared = Localize()
    var bundle: Bundle?
    
    init() {
        let language = UserDefaults.standard.string(forKey: CONSTANT.keyLanguage) ?? "en"
        loadBundle(with: language)
    }
    
    var language: String? {
        didSet {
            UserDefaults.standard.set(language, forKey: CONSTANT.keyLanguage)
            loadBundle(with: language)
        }
    }
    
    // Reset to default language
    func reset() {
        self.language = "vi"
    }
    
    private func loadBundle(with language: String?) {
        if let path = Bundle.main.path(forResource: language, ofType: "lproj") {
            bundle = Bundle(path: path)
        } else {
            bundle = Bundle.main
        }
    }
    
    fileprivate func localizedString(for key: String) -> String {
        return bundle?.localizedString(forKey: key, value: "", table: nil) ?? key
    }
}

extension String {
    var localized: String {
        return Localize.shared.localizedString(for: self)
    }
}
