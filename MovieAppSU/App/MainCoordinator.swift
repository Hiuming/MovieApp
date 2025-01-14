//
//  MainCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 26/11/24.
//

import Foundation
import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    var stack: Stinsen.NavigationStack<MainCoordinator>
    @Root var onboarding = makeOnboarding
    @Root var login = makeLogin
    
    var isActive: Bool = false
    init() {
        if isActive {
            stack = NavigationStack(initial: \MainCoordinator.login)
        } else {
            stack = NavigationStack(initial: \MainCoordinator.onboarding)
        }
    }
    
    @ViewBuilder func sharedView(_ view: AnyView) -> some View {
        view
            .onAppear {
                UITabBar.appearance().backgroundColor = .black
                UITabBar.appearance().barTintColor = .black
                if UserUltis.didFirstTimeLaunched {
                    self.root(\.login)
                } else {
                    self.root(\.onboarding)
                    UserUltis.didFirstTimeLaunched = true
                    
                }
            }
            .background(.primaryBackground)
    }
    
    
    func customize(_ view: AnyView) -> some View {
        sharedView(view)
    }
    
}

extension MainCoordinator {
    
    func makeOnboarding() -> NavigationViewCoordinator<OnboardingCoordinator> {
        NavigationViewCoordinator(OnboardingCoordinator())
    }
    
    func makeLogin() -> NavigationViewCoordinator<LoginCoordinator> {
        NavigationViewCoordinator(LoginCoordinator())
    }
    
    
}
