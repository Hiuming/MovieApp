//
//  MovieRepository.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 11/12/24.
//

import Combine
import Foundation

protocol MovieRepositoryType {
    func getPopularMovies(page: Int) -> AnyPublisher<MovieListResponseModel,Error>
    func getMockData() -> AnyPublisher<MovieListResponseModel?, Never>
}

class MovieRepository: MovieRepositoryType {
  
    private let apiService: APIService = APIService.shared
    
    func getPopularMovies(page: Int) -> AnyPublisher<MovieListResponseModel, Error> {
        apiService.request(nonBaseResponse: MovieRouter.getPopularMovies(page: page))
            .tryMap {(response: MovieListResponseModel) in
                return response
            }
            .eraseToAnyPublisher()
    }
    
    func getMockData() -> AnyPublisher<MovieListResponseModel?, Never> {
        let mockData: MovieListResponseModel? = Common.loadJSONFileToObject(fileName: "mockPopular")
            return Just(mockData)
                .eraseToAnyPublisher()
    }
}
