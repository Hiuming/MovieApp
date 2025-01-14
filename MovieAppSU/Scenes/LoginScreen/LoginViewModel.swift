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
    @LazyInjected(\.authUseCases) var useCase
    
    func getToken() {
        useCase.requestToken()
            .receive(on: DispatchQueue.main)
            .trackActivity(activityIndicator)
            .trackError(errorTracker)
            .sink { model in
                print(model)
            }
            .store(in: &bag)
            
    }
}
