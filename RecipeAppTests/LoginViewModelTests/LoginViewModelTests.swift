//
//  LoginViewModelTests.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import XCTest
@testable import RecipeApp

// MARK: - LoginViewModelTests
//
class LoginViewModelTests: XCTestCase {
    
    // MARK: - Properties
    //
    var sut: LoginViewModel!
    var loginUseCaseMock: LoginUseCaseMock!
    
    // MARK: - Lifecycle
    //
    override func setUp() {
        super.setUp()
        loginUseCaseMock = LoginUseCaseMock()
        sut = LoginViewModel(loginUseCase: loginUseCaseMock)
    }
    
    override func tearDown() {
        sut = nil
        loginUseCaseMock = nil
        super.tearDown()
    }
    
    /// Test submit user with valid credentia
    ///
    func testSubmitUserCredential_ValidCredentials_ReturnTrue() {
        // Given
        sut.password = "12345678"
        sut.email = "ahmed@gmail.com"
        // When
        sut.submit()
        // Then
        XCTAssert(loginUseCaseMock.executeCalled)
    }
    
    /// Test submit user to excute login but return with client error
    ///
    func testSubmitUserCredential_FailureRequestWithClientError_ReturnTrue() {
        // Given
        let error = "failed to build request"
        
        var state: State<Any>?

        sut?.state.subscribe({ newState in
            state = newState
        })
        
        // When
        sut.submit()
        loginUseCaseMock.testExcuteLogin_FailureCase_FailedAndReturnError()

        // Then
        XCTAssertEqual(state, State.failure(error))
    }

}
