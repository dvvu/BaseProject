//
//  UITableViewExtensions.swift
//  Ebates
//
//  Created by Macbook on 10/9/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func dequeue<T: Reusable>(cell: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as? T
    }
}
