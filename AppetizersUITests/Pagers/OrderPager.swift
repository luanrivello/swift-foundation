//
//  OrderViewPager.swift
//  AppetizersUITests
//
//  Created by lbr on 24/08/25.
//

import XCTest

struct OrderPage {
    let app: XCUIApplication

    var collectionView: XCUIElement { app.collectionViews.firstMatch }

    func verifyOrderListCount(_ expected: Int) {
        XCTAssertTrue(collectionView.waitForExistence(timeout: 10), "Order list not found")
        XCTAssertEqual(collectionView.cells.count, expected, "Order list count mismatch")
    }

    func placeOrder() {
        let button = app.buttons["Place Order"]
        XCTAssertTrue(button.waitForExistence(timeout: 10), "Place Order button not found")
        button.tap()
    }
    
    func goToTabHome() -> HomePager {
        app.tabBars.buttons["Home"].tap()
        return HomePager(app: app)
    }

    func goToTabOrder() -> AppetizerListPager {
        app.tabBars.buttons["List"].tap()
        return AppetizerListPager(app: app)
    }

    func goToTabAccount() -> AccountPager {
        app.tabBars.buttons["Account"].tap()
        return AccountPager(app: app)
    }
}

