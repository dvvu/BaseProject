//
//  BaseViewController.swift
//  BestDealMedication
//
//  Created by Macbook on 12/6/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var snackbar: TTGSnackbar! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.setLanguage), name: NOTIFICATION_NAME.localize, object: nil)
        // netword connection
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.internetConnectionFaild), name: NOTIFICATION_NAME.internetConnectionFaild, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.retry), name: NOTIFICATION_NAME.retryAPI, object: nil)
        setLanguage()
    }
    
    @objc func setLanguage() {
        
    }
    
    func configUI() {
        fatalError("Must Override")
    }
    
    func showError(error: String) {
        if (snackbar != nil) {
            snackbar.dismiss()
        }
        snackbar = TTGSnackbar(message: error,
                               duration: .forever,
                               actionText: "Action",
                               actionBlock: { (snackbar) in
                                snackbar.dismiss()
        })
        snackbar.duration = .middle
        snackbar.animationType = .slideFromTopToBottom
        snackbar.show()
    }
    
    @objc func updateSetting() {
        
    }
    
    @objc func internetConnectionFaild() {
        
        var titlea = "no_internet_title".localized
        var message = "no_internet_mess".localized
        var title1 = "no_internet_retry".localized
        var title2 = "no_internet_exit".localized
        
        if ("no_internet_title".localized == "no_internet_title") {
            titlea = ""
            message = "Please, check your internet."
            title1 = "Retry"
            title2 = "Exit"
        }
        let alert = UIAlertController(title: titlea, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: title1, style: .default, handler: {  (_) in
            NotificationCenter.default.post(name: NOTIFICATION_NAME.retryAPI, object: nil)
        }))
        
        alert.addAction(UIAlertAction(title: title2, style: .default, handler: { (_) in
            exit(0)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMessage(title: String, message: String, completion: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "pu_ok".localized, style: .default, handler: {  (_) in
            completion()
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showQuestionMessage(title: String, message: String, completion: @escaping (Bool) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "pu_yes".localized, style: .default, handler: {  (_) in
            completion(true)
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "pu_no".localized, style: .default, handler: {  (_) in
            completion(false)
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func retry() {
        
    }
}
