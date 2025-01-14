//
//  LoginRepository.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Combine

protocol AuthRepositoryType {
    func requestToken() -> AnyPublisher<RequestTokenModel,Error>
    func login(username: String, password: String) -> AnyPublisher<AuthModel,Error>
}

class AuthRepository: AuthRepositoryType {
  
    private let apiService: APIService = APIService.shared
    
    func requestToken() -> AnyPublisher<RequestTokenModel, Error> {
        apiService.request(nonBaseResponse: LoginRouter.getRequestToken)
            .tryMap {(response: RequestTokenModel) in
                return response
            }
            .eraseToAnyPublisher()
    }
    
    func login(username: String, password: String) -> AnyPublisher<AuthModel, any Error> {
        apiService.request(nonBaseResponse: LoginRouter.login(userName: username, password: password))
            .tryMap {(response: AuthModel) in
                return response
            }
            .eraseToAnyPublisher()
    }
    
}
