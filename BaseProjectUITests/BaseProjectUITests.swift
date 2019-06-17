//
//  BaseProjectUITests.swift
//  BaseProjectUITests
//
//  Created by Macbook on 6/14/19.
//  Copyright © 2019 translate.com. All rights reserved.
//

import XCTest
@testable import BaseProject

class BaseProjectUITests: XCTestCase {
    
//    var viewController = HomeViewController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testItemDisplayed() {
//        let dataTest = ItemViewModel.dataTest
//        viewController.items = dataTest
//
//        //2 Act
//        viewController.collectionView.reloadData()
//        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.5))
//
//        //3 Assert
//        let cells = viewController.collectionView.visibleCells as! [ItemCollectionViewCell]
//        XCTAssertEqual(cells.count, dataTest.count, "Cells count should match array.count")
//        for I in 0...cells.count - 1 {
//            let cell = cells[I]
//            XCTAssertEqual(cell.itemTitleLabel.text, dataTest[I].keywordText, "Text should be matching")
//        }
    }
}
