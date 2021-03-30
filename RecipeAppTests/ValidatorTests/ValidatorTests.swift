//
//  ValidatorTests.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import Foundation
import XCTest
@testable import RecipeApp

class ValidatorFactoryTests: XCTestCase {
    
    // MARK: - Tests
    //
    /// Test empty field
    ///
    func testRequredField_sendNotEmptyField_ReturnTrue() {
        // Given
        let field = "not empty"
        
        // When
        
        let notEmptyField =  try? ValidatorFactory
            .validatorFor(type: .requiredField(field: "Field"))
            .validated(field)
        // Then
        XCTAssertEqual(field, notEmptyField)
    }
    /// Test required field
    ///
    func testRequiredField_sendEmptyString_failedAndreturnError() {
        
        // Given
        let field = ""
        // When
        do {
            try _ = ValidatorFactory
                .validatorFor(type: .requiredField(field: "Field"))
                .validated(field)
            
        } catch {
            // Then
            XCTAssert(error is ValidationError)
            XCTAssertEqual(error.localizedDescription, "Required Field")
        }
    }
    /// Test valid password
    ///
    func testValidatePassword_sendValidPassword_SuccessAndReturnTrue() {
        
        // Given
        let passwordField = "Consumer@585"
        
        // When
        
        let validPassword =  try? ValidatorFactory
            .validatorFor(type: .password)
            .validated(passwordField)
        // Then
        XCTAssertEqual(validPassword, passwordField)
    }
    /// Test invalid password
    ///
    func testValidatePassword_sendNotValidPassword_returnFailedMessage() {
        // Given
        let passwordField = "123"
        
        // When
        do {
            let validPassword =  try ValidatorFactory
                .validatorFor(type: .password)
                .validated(passwordField)
            
            // Then
            XCTAssertNil(validPassword)
        } catch {
            XCTAssert(error is ValidationError)
            XCTAssertEqual(error.localizedDescription, "Invalid password. At least 8 characters are required.")
        }
    }
    /// Test validte email
    ///
    func testValidateEmail_sendValidEmail_ReturnTrue() {
        
        // Given
        let emailField = "ahmedali@gmail.com"
        
        // When
        
        let validEmail =  try? ValidatorFactory
            .validatorFor(type: .email)
            .validated(emailField)
        // Then
        XCTAssertNotNil(validEmail)
        XCTAssertEqual(validEmail, emailField)
    }
    /// Test invalid email
    ///
    func testValidateEmail_sendNotValidEmail_FailedAndReturnError() {
        // Given
        let emailField = "invalidemail"
        
        // When
        do {
            let validEmail = try ValidatorFactory
                .validatorFor(type: .email)
                .validated(emailField)
            
            // Then
            XCTAssertNil(validEmail)
        } catch {
            XCTAssert(error is ValidationError)
            XCTAssertEqual(error.localizedDescription, "Invalid e-mail Address")
        }
    }
}
