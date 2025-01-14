//
//  OnboardingCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 2/12/24.
//
import Stinsen
import Foundation
import SwiftUI
final class OnboardingCoordinator: NavigationCoordinatable {
    var stack = NavigationStack(initial: \OnboardingCoordinator.start)
    @Root var start = makeStart
    @State private var showSplash: Bool = true
}

extension OnboardingCoordinator {
    @ViewBuilder func makeStart() -> some View {
       //HomeView(mockView: true)
        OnboardingView()
    }
}
