//
//  LoginViewModel.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Foundation
import SwiftUI
import Combine
import Factory
import Stinsen
class LoginViewModel: ObservableObject {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    private var bag = Set<AnyCancellable>()
    @Published var isLoading = false
    @LazyInjected(\.authUseCases) var useCase
    
    private func getToken() async throws -> Bool {
        do {
            return try await withCheckedThrowingContinuation { continuation in
                useCase.requestToken()
                    .receive(on: DispatchQueue.global(qos: .background))
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .sink { model in
                        if let success = model.success, success {
                            UserUltis.requestToken = model.request_token ?? ""
                            continuation.resume(returning: success)
                        } else {
                            continuation.resume(throwing: APIError.invalidResponseData(data: model))
                        }
                    }
                    .store(in: &bag)
            }
        } catch {
            throw APIError.unknown
        }
    }
    
    func login(userName: String, password: String, completionHandler: @escaping((Bool) -> Void)) {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                Task { @MainActor in
                    self.isLoading = true
                }
                let getTokenSuccess: Bool = try await getToken()
                if getTokenSuccess {
                    useCase.login(username: userName, password: password)
                        .receive(on: DispatchQueue.main)
                        .trackActivity(activityIndicator)
                        .trackError(errorTracker)
                        .sink(receiveCompletion: { value -> Void  in
                            self.isLoading = false
                        }
                              ,receiveValue: { model in
                            completionHandler(model.success ?? false)
                        })
                    
                        .store(in: &bag)
                    
                }
            } catch {
                Task {@MainActor [weak self] in
                    self?.isLoading = false
                }
            }
        }
        
    }
}
