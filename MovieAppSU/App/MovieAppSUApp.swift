//
//  MovieAppSUApp.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 25/11/24.
//

import SwiftUI

@main
struct MovieAppSUApp: App {
    @State var isActive: Bool = false
    
    init() {
        Log.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            if !isActive {
                SplashScreen(isActive: $isActive)
            } else {
                MainCoordinator().view()
            }
        }
    }
}
