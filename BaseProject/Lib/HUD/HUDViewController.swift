//
//  HUDViewController.swift
//  survey
//
//  Created by Linh.Nguyen on 7/12/18.
//  Copyright © 2018 STS. All rights reserved.
//

import UIKit

enum HUDViewType {
    case LoadingMessage
    case Default
}

class HUDViewController: UIViewController {
    
    @IBOutlet weak var loadingMessageLabel: UILabel!
    @IBOutlet weak var loadingMessageView: UIView!
    @IBOutlet weak var loadingImageView: UIImageView!
    static var shared:HUDViewController = HUDViewController(nibName: "HUDViewController", bundle: nil)

    typealias SuccessHandler = (Bool) -> Void
    var handler:SuccessHandler?
    var type: HUDViewType = .Default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HUDViewController.shared = self
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.37)
        self.loadingImageView.loadGif(name: "loadingActivity")
    }
    
    private func show() {
        if (type == .LoadingMessage) {
            loadingMessageView.backgroundColor = UIColor.white
            loadingMessageLabel.textColor = UIColor.init(hex: "5f5d70")
        }
        
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.addSubview(self.view)
            self.view.frame = (appDelegate.window?.bounds)!
            UIView.animate(withDuration: 1) {}
        }
    }
    
    private func dismiss() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: { 
            self.view.removeFromSuperview()
        }) { (error) in}
        if HUDViewController.shared.handler != nil {
            HUDViewController.shared.handler!(true)
        }
        type = .Default
    }
    
    class func showLoading(success: @escaping SuccessHandler) {
        HUDViewController.shared.handler = success
        HUDViewController.shared.show()
    }
    
    class func dismissLoading() {
        HUDViewController.shared.dismiss()
    }
}
