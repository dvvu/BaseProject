//
//  UIViewControllerExtension.swift
//  Ebates
//
//  Created by Macbook on 10/19/18.
//  Copyright © 2018 personal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        DispatchQueue.main.async {
            () -> Void in
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false)
        }
    }
    
    func dismissDetail() {
        DispatchQueue.main.async {
            () -> Void in
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.dismiss(animated: false)
        }
    }
    
    func presentPopUpDetail(_ viewControllerToPresent: UIViewController) {
        DispatchQueue.main.async {
            () -> Void in
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.fade
            transition.subtype = CATransitionSubtype.fromBottom
            viewControllerToPresent.modalPresentationStyle = .overCurrentContext
            viewControllerToPresent.modalTransitionStyle = .crossDissolve
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false)
        }
    }
    
    func dismissPopUpDetail() {
        DispatchQueue.main.async {
            () -> Void in
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.fade
            transition.subtype = CATransitionSubtype.fromTop
            self.view.window!.layer.add(transition, forKey: kCATransition)
            self.dismiss(animated: false)
        }
    }
}
