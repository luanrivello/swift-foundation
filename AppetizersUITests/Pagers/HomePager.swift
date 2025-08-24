//
//  HomePager.swift
//  AppetizersUITests
//
//  Created by lbr on 24/08/25.
//

import XCTest

struct HomePager {
    let app: XCUIApplication

    func goToTabList() -> AppetizerListPager {
        app.tabBars.buttons["List"].tap()
        return AppetizerListPager(app: app)
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
