//
//  RecipeUseCase.swift
//  RecipeApp
//
//  Created by Ahmed Ali on 28/03/2021.
//

import Foundation

// MARK: - RecipeUseCase
//
protocol RecipeUseCaseType {
    func execute(onCompletion: @escaping (Result<[RecipeMainModel], Error>) -> Void )
}

final class RecipeUseCase: RecipeUseCaseType {
    
    // MARK: - Properties
    //
    let network = NetworkManager<RecipeEndPoint>()
    
    func execute(onCompletion: @escaping (Result<[RecipeMainModel], Error>) -> Void) {
        
        network.request(api: .getRecipes) { (result: Result<[RecipeMainModel], NetworkError>) in
            
            switch result {
            
            case .success(let response):
                onCompletion(.success(response))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}
