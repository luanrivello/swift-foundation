//
//  AppNavigation.swift
//  AppetizersUITests
//
//  Created by lbr on 24/08/25.
//

import XCTest

extension XCUIApplication {
    @discardableResult
    func launchToHome() -> HomePager {
        self.launch()
        return HomePager(app: self)
    }
}
