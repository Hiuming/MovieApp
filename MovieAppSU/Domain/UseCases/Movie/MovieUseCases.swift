//
//  MovieUseCases.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 11/12/24.
//

import Foundation
import Factory
import Combine

protocol MovieUseCasesType {
    func getPopularMovies(page: Int) -> AnyPublisher<MovieListResponseModel,Error>
    func getMockData() -> AnyPublisher<MovieListResponseModel?, Never>
}

class MovieUseCases: MovieUseCasesType {
    @LazyInjected(\.movieRepository) var repository
    func getPopularMovies(page: Int) -> AnyPublisher<MovieListResponseModel, any Error> {
        repository.getPopularMovies(page: page)
    }
    
    func getMockData() -> AnyPublisher<MovieListResponseModel?, Never> {
        repository.getMockData()
    }
}
