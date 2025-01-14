//
//  AuthUseCases.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Foundation
import Factory
import Combine

protocol AuthUseCasesType {
    func requestToken() -> AnyPublisher<RequestTokenModel,Error>
    func login(username: String, password: String) -> AnyPublisher<AuthModel,Error>
}

class AuthUseCases: AuthUseCasesType {
    @LazyInjected(\.authRepository) var repository
    func requestToken() -> AnyPublisher<RequestTokenModel, any Error> {
        repository.requestToken()
    }
    
    func login(username: String, password: String) -> AnyPublisher<AuthModel, any Error> {
        repository.login(username: username, password: password)
    }
}
