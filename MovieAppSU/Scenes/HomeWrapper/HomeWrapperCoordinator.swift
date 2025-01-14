//
//  HomeWrapperCoordinator.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 23/12/24.
//
//

import Foundation
import SwiftUI
import Stinsen
final class HomeWrapperCoordinator: TabCoordinatable {
    var child = TabChild(
        startingItems: [
            \HomeWrapperCoordinator.home,
             \HomeWrapperCoordinator.explore,
             \HomeWrapperCoordinator.movies,
             \HomeWrapperCoordinator.profile
        ]
    )
    
    
    @Route(tabItem: makeHomeTab) var home = makeHome
    @Route(tabItem: makeExploreTab) var explore = makeExplore
    @Route(tabItem: makeProfileTab) var profile = makeProfile
    @Route(tabItem: makeMoviesTab) var movies = makeMovie
    
    
    deinit {
        print("Deinit Home Wrapper")
    }
}

extension HomeWrapperCoordinator {
    
    
    //TAB BUILDER
    @ViewBuilder func makeHomeTab(isActive: Bool) -> some View {
        if isActive {
            Image(ImageResource.icHomeSelected)
        } else {
            Image(ImageResource.icHome)
        }
        Text("Home")
    }
    
    func makeHome() -> HomeCoordinator {
        return HomeCoordinator()
    }
    
    
    @ViewBuilder func makeExploreTab(isActive: Bool) -> some View {
        if isActive {
            Image(ImageResource.icExploreSelected)
        } else {
            Image(ImageResource.icExplore)
        }
        Text("Explore")
    }
    
    func makeExplore() -> ExploreCoordinator {
        return ExploreCoordinator()
    }
    
    
    @ViewBuilder func makeMoviesTab(isActive: Bool) -> some View {
        Image(systemName: "folder" + (isActive ? ".fill" : ""))
        Text("Movies")
    }
    
    func makeProfile() -> ProfileCoordinator {
        return ProfileCoordinator()
    }
    
    @ViewBuilder func makeProfileTab(isActive: Bool) -> some View {
        Image(systemName: "person.crop.circle" + (isActive ? ".fill" : ""))
        Text("Profile")
    }
    
    func makeMovie() -> MoviesCoordinator {
        return MoviesCoordinator()
    }
}
