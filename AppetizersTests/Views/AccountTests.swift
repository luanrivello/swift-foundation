//
//  AccountViewModelTests.swift
//  AppetizersTests
//
//  Created by lbr on 23/08/25.
//

import XCTest
import SwiftUI
@testable import Appetizers

final class AccountViewModelTests: XCTestCase {
    
    func test_validForm_returnsTrueForValidUser() {
        // Given
        let viewModel = AccountViewModel()
        viewModel.user = TestData.sampleUser()
        
        // When
        let isValid = viewModel.isValidForm
        
        // Then
        XCTAssertTrue(isValid)
        XCTAssertNil(viewModel.alertItem)
    }
    
    func test_validForm_returnsFalseForEmptyFields() {
        // Given
        let viewModel = AccountViewModel()
        viewModel.user = User() // Empty user
        
        // When
        let isValid = viewModel.isValidForm
        
        // Then
        XCTAssertFalse(isValid)
        XCTAssertEqual(viewModel.alertItem?.title, Text("Invalid Form"))
    }
    
    func test_validForm_returnsFalseForInvalidEmail() {
        // Given
        var invalidUser = TestData.sampleUser()
        invalidUser.email = "not-an-email"
        let viewModel = AccountViewModel()
        viewModel.user = invalidUser
        
        // When
        let isValid = viewModel.isValidForm
        
        // Then
        XCTAssertFalse(isValid)
        XCTAssertEqual(viewModel.alertItem?.title, Text("Invalid Email"))
    }
    
    func test_saveChanges_encodesAndSavesUser() {
        // Given
        let viewModel = AccountViewModel()
        viewModel.user = TestData.sampleUser()
        
        // When
        viewModel.saveChanges()
        
        // Then
        XCTAssertNotNil(viewModel.alertItem)
        XCTAssertEqual(viewModel.alertItem?.title, Text("Profile Saved"))
    }
    
    func test_retriveUser_decodesSavedUser() {
        // Given
        let viewModel = AccountViewModel()
        let sample = TestData.sampleUser()
        viewModel.user = sample
        viewModel.saveChanges()
        
        let newViewModel = AccountViewModel()
        
        // When
        newViewModel.retriveUser()
        
        // Then
        XCTAssertEqual(newViewModel.user.firstName, sample.firstName)
        XCTAssertEqual(newViewModel.user.lastName, sample.lastName)
        XCTAssertEqual(newViewModel.user.email, sample.email)
    }
    
    func test_retriveUser_setsAlertOnDecodeError() {
        // Given
        let viewModel = AccountViewModel()
        UserDefaults.standard.set(Data([0x00, 0x01, 0x02]), forKey: "user")
        
        // When
        viewModel.retriveUser()
        
        // Then
        XCTAssertEqual(viewModel.alertItem?.title, Text("Profile Error"))
    }
}
