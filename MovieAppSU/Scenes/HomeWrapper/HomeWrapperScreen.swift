//
//  HomeWrapperScreen.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 23/12/24.
//

import Foundation
import SwiftUI
import Stinsen

struct HomeWrapperScreen: View {
    @EnvironmentObject private var authenticatedRouter: HomeWrapperCoordinator.Router
    

    var body: some View {
            authenticatedRouter.focusFirst(\.home)
            .view()
    }
}

#Preview {
    HomeWrapperScreen().environmentObject(HomeWrapperCoordinator())
}
