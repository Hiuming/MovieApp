//
//  HomeCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 29/11/24.



import Foundation
import SwiftUI

import Stinsen

final class HomeCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \HomeCoordinator.start)

    @Root var start = makeStart
    
    deinit {
        print("Deinit HomeCoordinator")
    }
}

extension HomeCoordinator {
    @ViewBuilder func makeStart() -> some View {
        HomeView(mockView: true)
    }
}
