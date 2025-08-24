//
//  AccountPager.swift
//  AppetizersUITests
//
//  Created by lbr on 24/08/25.
//

import XCTest

struct AccountPager {
    let app: XCUIApplication
    
    var firstNameField: XCUIElement { app.textFields["First Name"] }
    var lastNameField: XCUIElement { app.textFields["Last Name"] }
    var emailField: XCUIElement { app.textFields["Email"] }
    var birthdayPicker: XCUIElement { app.datePickers["birthdayPicker"] }

    var saveChangesButton: XCUIElement { app.buttons["Save Changes"] }
    
    var lactoseToggle: XCUIElement { app.switches["Lactose Intolerance"] }
    var celiacToggle: XCUIElement { app.switches["Ciliac Disease"] }
    var diabeticToggle: XCUIElement { app.switches["Diabetic"] }
    
    func enterFirstName(_ text: String) {
        XCTAssertTrue(firstNameField.waitForExistence(timeout: 3))
        firstNameField.tap()
        firstNameField.typeText(text)
    }
    
    func enterLastName(_ text: String) {
        XCTAssertTrue(lastNameField.waitForExistence(timeout: 3))
        lastNameField.tap()
        lastNameField.typeText(text)
    }
    
    func enterEmail(_ text: String) {
        XCTAssertTrue(emailField.waitForExistence(timeout: 3))
        emailField.tap()
        emailField.typeText(text)
    }
    
    func toggleLactose() {
        XCTAssertTrue(lactoseToggle.waitForExistence(timeout: 3))
        lactoseToggle.tap()
    }
    
    func toggleCeliac() {
        XCTAssertTrue(celiacToggle.waitForExistence(timeout: 3))
        celiacToggle.tap()
    }
    
    func toggleDiabetic() {
        XCTAssertTrue(diabeticToggle.waitForExistence(timeout: 3))
        diabeticToggle.tap()
    }
    
    func saveChanges() {
        XCTAssertTrue(saveChangesButton.waitForExistence(timeout: 3))
        saveChangesButton.tap()
    }
    
    func goToTabHome() -> HomePager {
        app.tabBars.buttons["Home"].tap()
        return HomePager(app: app)
    }

    func goToTabOrder() -> AppetizerListPager {
        app.tabBars.buttons["List"].tap()
        return AppetizerListPager(app: app)
    }

    func goToTabAccount() -> OrderPage {
        app.tabBars.buttons["Order"].tap()
        return OrderPage(app: app)
    }

}
