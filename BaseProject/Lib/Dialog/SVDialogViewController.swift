//
//  SVDialogViewController.swift
//  survey
//
//  Created by Macbook on 7/13/18.
//  Copyright © 2018 STS. All rights reserved.
//

import UIKit

enum SVDialogType {
    case Warning
    case Info
    case Success
    case logout
    case RedemmSuccess
    case InvalidToken
}

class SVDialogViewController: UIViewController {

    @IBOutlet weak var dialogImageView: UIImageView!
    @IBOutlet weak var dialogTitleLabel: UILabel!
    @IBOutlet weak var dialogMessageLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var okbutton: UIButton!
    
    static var shared: SVDialogViewController = SVDialogViewController(nibName: "SVDialogViewController", bundle: nil)
    typealias SuccessHandler = (Bool) -> Void
    typealias AgreeHandler = (Bool) -> Void
    typealias CancelHandler = (Bool) -> Void
    
    var handler:SuccessHandler?
    var cancelHandler:CancelHandler?
    var agreeHandler:AgreeHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.37)
        SVDialogViewController.shared = self
    }
    
    private func show() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.addSubview(self.view)
        self.view.frame = (appDelegate.window?.bounds)!
        
        UIView.animate(withDuration: 1) {
            
        }
    }
    
    private func dismiss() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
        
            self.view.removeFromSuperview()
        }) { (error) in}
        
        if SVDialogViewController.shared.handler != nil {
           
            SVDialogViewController.shared.handler!(true)
        }
    }
    
    class func showDialog(dialogType:SVDialogType, dialogTitle:String, dialogMessage:String, titleButtton1:String, success: @escaping SuccessHandler, action1: @escaping CancelHandler) {
        
        SVDialogViewController.shared.handler = success
        SVDialogViewController.shared.agreeHandler = action1
        SVDialogViewController.shared.show()
        SVDialogViewController.shared.configDialog(dialogType:dialogType, dialogTitle:dialogTitle, dialogMessage:dialogMessage, titleButtton1:titleButtton1, titleButton2:"")
    }
    
    class func showDialog(dialogType:SVDialogType, dialogTitle:String, dialogMessage:String, titleButtton1:String, titleButton2:String, success: @escaping SuccessHandler, action1: @escaping CancelHandler, action2: @escaping AgreeHandler ) {
      
        SVDialogViewController.shared.handler = success
        SVDialogViewController.shared.cancelHandler = action1
        SVDialogViewController.shared.agreeHandler = action2
        SVDialogViewController.shared.show()
        SVDialogViewController.shared.configDialog(dialogType:dialogType, dialogTitle:dialogTitle, dialogMessage:dialogMessage, titleButtton1:titleButtton1, titleButton2:titleButton2)
    }
    
    func configDialog(dialogType:SVDialogType, dialogTitle:String, dialogMessage:String, titleButtton1:String, titleButton2:String) {
        
        okbutton.isHidden = true
        switch dialogType {
        case .Info:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_info")
            break
        case .Warning:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_warning")
            break
        case .Success:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_success")
            break
        case .logout:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_logout")
            agreeButton.setTitleColor(UIColor.init(hex: "e1495a"), for: .normal)
            break
        case .RedemmSuccess:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_success")
            okbutton.isHidden = false
            okbutton.setTitle(titleButtton1.localized.uppercased(), for: .normal)
            break
        case .InvalidToken:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_logout")
            okbutton.isHidden = false
            okbutton.setTitle(titleButtton1.localized.uppercased(), for: .normal)
            break
        default:
            dialogImageView.image = #imageLiteral(resourceName: "ic_dialog_logout")
            okbutton.isHidden = false
            okbutton.setTitle(titleButtton1.localized.uppercased(), for: .normal)
            break
        }
        
        dialogTitleLabel.text = dialogTitle
        dialogMessageLabel.text = dialogMessage
        cancelButton.setTitle(titleButtton1, for: .normal)
        agreeButton.setTitle(titleButton2, for: .normal)
    }
    
    class func dismissLoading() {
        
        SVDialogViewController.shared.dismiss()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        SVDialogViewController.shared.cancelHandler!(true)
        self.dismiss()
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        
        SVDialogViewController.shared.agreeHandler!(true)
        self.dismiss()
    }
    
    @IBAction func okbuttonAction(_ sender: Any) {
        SVDialogViewController.shared.agreeHandler!(true)
        self.dismiss()
    }
}
