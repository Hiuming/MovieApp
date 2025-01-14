//
//  ExploreCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 23/12/24.
//

import Foundation
import SwiftUI
import Stinsen

final class ExploreCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \ExploreCoordinator.start)

    @Root var start = makeStart
    
    
    deinit {
        print("Deinit HomeCoordinator")
    }
}

extension ExploreCoordinator {
    @ViewBuilder func makeStart() -> some View {
        VStack {
            Text("Explore")
                .font(.subHead2)
                .foregroundStyle(.subtitleGrey)
        }
        
    }
}

