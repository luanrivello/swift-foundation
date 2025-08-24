//
//  AppetizerListNavigation.swift
//  AppetizersUITests
//
//  Created by lbr on 24/08/25.
//

import XCTest

struct AppetizerListPager {
    let app: XCUIApplication

    var collectionView: XCUIElement { app.collectionViews.firstMatch }

    func addAppetizer(at index: Int) {
        let cell = collectionView.cells.element(boundBy: index)
        XCTAssertTrue(cell.waitForExistence(timeout: 10), "Appetizer cell \(index) not found")
        cell.tap()

        let addButton = app.buttons["addToOrderButton"]
        XCTAssertTrue(addButton.waitForExistence(timeout: 10), "Add button not found")
        addButton.tap()
    }
    
    func goToTabHome() -> HomePager {
        app.tabBars.buttons["Home"].tap()
        return HomePager(app: app)
    }

    func goToTabOrder() -> OrderPage {
        app.tabBars.buttons["Order"].tap()
        return OrderPage(app: app)
    }

    func goToTabAccount() -> AccountPager {
        app.tabBars.buttons["Account"].tap()
        return AccountPager(app: app)
    }
}
