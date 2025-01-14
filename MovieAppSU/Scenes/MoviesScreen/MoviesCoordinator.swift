
//
//  MoviesCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 23/12/24.
//

import Foundation
import SwiftUI
import Stinsen

final class MoviesCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MoviesCoordinator.start)

    @Root var start = makeStart
    
    
    deinit {
        print("Deinit HomeCoordinator")
    }
    
}

extension MoviesCoordinator {
    @ViewBuilder func makeStart() -> some View {
        VStack {
            Text("Movie")
                .font(.subHead2)
                .foregroundStyle(.subtitleGrey)
        }
        
    }
}
