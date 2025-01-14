//
//  AppDelegate+Injected.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 26/11/24.
//

import Foundation
import Factory

extension Container {
    //MARK: Auth
    var authRepository: Factory<AuthRepositoryType> {
        self {
            AuthRepository()
        }
    }
    
    var authUseCases: Factory<AuthUseCasesType> {
        self {
            AuthUseCases()
        }
    }
    
    
    //MARK: Movie
    
    var movieRepository: Factory<MovieRepositoryType> {
        self {
            MovieRepository()
        }
    }
    
    var movieUseCases: Factory<MovieUseCasesType> {
        self {
            MovieUseCases()
        }
    }
    
}
