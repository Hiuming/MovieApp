//
//  LoginCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//

import Stinsen
import Foundation
import SwiftUI

final class LoginCoordinator: NavigationCoordinatable {
    var stack = NavigationStack(initial: \LoginCoordinator.start)
    @Root var start = makeLogin
    @Root var loggedIn = makeLoginSuccess
}

extension LoginCoordinator {
    @ViewBuilder func makeLogin() -> some View {
        LoginView()
    }
    
    func makeLoginSuccess() -> NavigationViewCoordinator<HomeWrapperCoordinator> {
        NavigationViewCoordinator(HomeWrapperCoordinator())
    }
    
}
