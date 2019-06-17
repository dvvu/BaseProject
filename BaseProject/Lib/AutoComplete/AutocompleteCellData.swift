//
//  AutocompleteCellData.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/12/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit

public protocol AutocompletableOption {
    var text: String { get }
    var code: String { get }
}

open class AutocompleteCellData: AutocompletableOption {
   
    public let code: String
    fileprivate let _text: String
    open var text: String { get { return _text } }
    public let image: UIImage?

    public init(code: String, text: String, image: UIImage?) {
        self.code = code
        self._text = text
        self.image = image
    }
}
