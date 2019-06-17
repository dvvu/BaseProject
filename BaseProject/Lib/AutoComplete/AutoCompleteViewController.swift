//
//  AutoCompleteViewController.swift
//  Autocomplete
//
//  Created by Amir Rezvani on 3/6/16.
//  Copyright © 2016 cjcoaxapps. All rights reserved.
//

import UIKit

let AutocompleteCellReuseIdentifier = "autocompleteCell"

open class AutoCompleteViewController: UIViewController {
    //MARK: - outlets
    @IBOutlet fileprivate weak var tableView: UITableView!

    //MARK: - internal items
    internal var autocompleteItems: [AutocompletableOption]?
    internal var cellHeight: CGFloat?
    internal var cellDataAssigner: ((_ cell: UITableViewCell, _ data: AutocompletableOption) -> Void)?
    var textField: UITextField?
    internal let animationDuration: TimeInterval = 0.2    

    //MARK: - private properties
    
    fileprivate var maxHeight: CGFloat = 0
    fileprivate var height: CGFloat = 0
    
    var autocompleteThreshold: Int?

    //MARK: - public properties
    open weak var delegate: AutocompleteDelegate?

    //MARK: - view life cycle
    override open func viewDidLoad() {
        super.viewDidLoad()

        self.view.isHidden = true
        self.textField = self.delegate!.autoCompleteTextField()
        tableView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.clear
        let point = self.textField?.convert(CGPoint.zero, to: self.parent?.view)
        self.height = self.delegate!.autoCompleteHeight()
        self.view.frame = CGRect(x: self.textField!.frame.minX,
            y: (point?.y)!+43,
            width: UIScreen.main.bounds.width-48,
            height: self.height)

        self.tableView.register(self.delegate!.nibForAutoCompleteCell(), forCellReuseIdentifier: AutocompleteCellReuseIdentifier)

        self.textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.textField?.addTarget(self, action: #selector(textFieldDidBegin(_:)), for: .editingDidBegin)
        
        self.autocompleteThreshold = self.delegate!.autoCompleteThreshold(self.textField!)
        self.cellDataAssigner = self.delegate!.getCellDataAssigner()

        self.cellHeight = self.delegate!.heightForCells()
        // not to go beyond bound height if list of items is too big
        self.maxHeight = self.height//UIScreen.main.bounds.height - self.view.frame.minY
        self.autocompleteThreshold! = -1;
        textFieldDidChange(self.textField!)
    }

     @objc func textFieldDidBegin(_ textField: UITextField) {
        dismissAutoComplete()
        self.autocompleteThreshold! = -1;
        textFieldDidChange(textField)
    }
    //MARK: - private methods
    @objc func textFieldDidChange(_ textField: UITextField) {

        let numberOfCharacters = textField.text?.count
        if let numberOfCharacters = numberOfCharacters {
            if numberOfCharacters != self.autocompleteThreshold! {
                self.autocompleteThreshold = numberOfCharacters
                self.view.isHidden = false
                guard let searchTerm = textField.text else { return }
                self.autocompleteItems = self.delegate!.autoCompleteItemsForSearchTerm(searchTerm)
                UIView.animate(withDuration: self.animationDuration,
                    delay: 0.0,
                    options: UIView.AnimationOptions(),
                    animations: { () -> Void in
                        self.view.frame.size.height = min(
                            CGFloat(self.autocompleteItems!.count) * CGFloat(self.cellHeight!),
                            self.maxHeight,
                            self.height
                        )
                    },
                    completion: nil)

                UIView.transition(with: self.tableView,
                    duration: self.animationDuration,
                    options: .transitionCrossDissolve,
                    animations: { () -> Void in
                        self.tableView.reloadData()
                    },
                    completion: nil)

            } else {
                self.view.isHidden = true
            }
        }
        dismissAutoComplete()
        if ((self.autocompleteItems?.count)! > 0) {
            let point = self.textField?.convert(CGPoint.zero, to: self.parent?.view)
            var y = point?.y
            // position and height table
            if((point?.y)! + 43 + self.height > UIScreen.main.bounds.height-44) {
                
                y = (point?.y)! - self.height - 43
                
                if (tableView.contentSize.height < self.height) {
                    
                    y = y! + (self.height - tableView.contentSize.height)
                }
            }
            self.view.frame = CGRect(x: self.textField!.frame.minX,
                                     y: y!+43,
                                     width: UIScreen.main.bounds.width-48,
                                     height: min(self.height, CGFloat((self.autocompleteItems?.count)!*44)))
        }
        
    }

    func dismissAutoComplete() {
        self.view.frame.size.height = 0
    }
    
    func reloadData() {
        self.autocompleteThreshold = 0
        let numberOfCharacters = textField?.text?.count
        if let numberOfCharacters = numberOfCharacters {
            if numberOfCharacters != self.autocompleteThreshold! {
                self.autocompleteThreshold = numberOfCharacters
                self.view.isHidden = false
                
                UIView.animate(withDuration: self.animationDuration,
                               delay: 0.0,
                               options: UIView.AnimationOptions(),
                               animations: { () -> Void in
                                self.view.frame.size.height = min(
                                    CGFloat(self.autocompleteItems!.count) * CGFloat(self.cellHeight!),
                                    self.maxHeight,
                                    self.height
                                )
                },
                               completion: nil)
                
                UIView.transition(with: self.tableView,
                                  duration: self.animationDuration,
                                  options: .transitionCrossDissolve,
                                  animations: { () -> Void in
                                    self.tableView.reloadData()
                },
                                  completion: nil)
                
            } else {
                self.view.isHidden = true
            }
        }
        
        dismissAutoComplete()
        
        if ((self.autocompleteItems?.count)! > 0) {
        let point = self.textField?.convert(CGPoint.zero, to: self.parent?.view)
        var y = point?.y
        // position and height table
        if((point?.y)! + 43 + self.height > UIScreen.main.bounds.height-44) {
            
            y = (point?.y)! - self.height - 43
            
            if (tableView.contentSize.height < self.height) {
                
                y = y! + (self.height - tableView.contentSize.height)
            }
        }
        self.view.frame = CGRect(x: self.textField!.frame.minX,
                                 y: y!+43,
                                 width: UIScreen.main.bounds.width-48,
                                 height: self.height)
        }
        
    }
}
