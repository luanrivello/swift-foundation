//
//  AppetizersUITests.swift
//  AppetizersUITests
//
//  Created by lbr on 24/08/25.
//

import XCTest
@testable import Appetizers

final class AppetizerUITests: XCTestCase {
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testAccountCreation() {
        let app = XCUIApplication()
        app.launchArguments.append("UITest_ResetUserDefaults")
        let home = app.launchToHome()

        let accountPage = home.goToTabAccount()
        accountPage.enterFirstName("Rainy")
        accountPage.enterLastName("Night")
        accountPage.enterEmail("rainy.night@maid.cafe")
        accountPage.toggleLactose()
        accountPage.toggleCeliac()
        accountPage.toggleDiabetic()
        accountPage.saveChanges()
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "AccountCreation"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testOrderFlow() {
        let app = XCUIApplication()
        let homePage = app.launchToHome()
        
        let listPage = homePage.goToTabList()
        listPage.addAppetizer(at: 0)
        listPage.addAppetizer(at: 0)
        listPage.addAppetizer(at: 2)
        
        let orderPage = listPage.goToTabOrder()
        orderPage.verifyOrderListCount(3)
        orderPage.placeOrder()
        orderPage.verifyOrderListCount(0)
    }
}
