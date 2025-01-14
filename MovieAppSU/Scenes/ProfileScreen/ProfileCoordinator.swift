//
//  ProfileCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 23/12/24.
//

import Foundation
import SwiftUI
import Stinsen

final class ProfileCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \ProfileCoordinator.start)

    @Root var start = makeStart
    
    
    deinit {
        print("Deinit HomeCoordinator")
    }
    
}

extension ProfileCoordinator {
    @ViewBuilder func makeStart() -> some View {
        VStack {
            Text("Profile")
                .font(.subHead2)
                .foregroundStyle(.subtitleGrey)
        }
        
    }
}
