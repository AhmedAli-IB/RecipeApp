//
//  RecipeListViewModelTests.swift
//  RecipeAppTests
//
//  Created by Ahmed Ali on 30/03/2021.
//

import XCTest
@testable import RecipeApp

// MARK: - RecipeListViewModelTests
//
class RecipeListViewModelTests: XCTestCase {
    
    // MARK: - Properties
    //
    var sut: RecipeListViewModel!
    var recipeUseCase: RecipeListUseCaseMock!
    
    // MARK: - Lifecycle
    //
    override func setUp() {
        super.setUp()
        recipeUseCase = RecipeListUseCaseMock()
        sut = RecipeListViewModel(recipeUseCase: recipeUseCase)
    }
    
    override func tearDown() {
        sut = nil
        recipeUseCase = nil
        super.tearDown()
    }
    
    /// test hit recipe list end point
    ///
    func testHitRecipeListEndPoint_ReturnTrue() {
        // Given
        var state: State<Any>?

        sut?.state.subscribe({ newState in
            state = newState
        })
        // When
        sut.viewDidLoad()
        // Then
        XCTAssert(recipeUseCase.executeCalled)
        
        recipeUseCase.testExcuteRecipeList_SuccessCase_ReturnTrue()

        XCTAssertEqual(state, State.success)
    }
    
    /// Test hit recipe list end point but return with client error
    ///
    func testHitRecipeListEndPoint_FailureRequestWithClientError_ReturnTrue() {
        // Given
        let error = "failed to build request"
        
        var state: State<Any>?

        sut?.state.subscribe({ newState in
            state = newState
        })
        
        // When
        sut.viewDidLoad()
        recipeUseCase.testExcuteRecipeList_FailureCase_FailedAndReturnError()

        // Then
        XCTAssertEqual(state, State.failure(error))
    }

}
