//
//  HomeViewModel.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 29/11/24.
//

import Foundation
import SwiftUI
import Combine
import Factory
import Stinsen

class HomeViewModel: ObservableObject {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    private var bag = Set<AnyCancellable>()
    private var page: Int = 1
    @Published var poppularMovieList = [MovieModel]()
    @Published var radioTagProvider = [TagButtonStateProvider]()
    @LazyInjected(\.movieUseCases) var useCase
    
    func getPopularMovies() {
        useCase.getPopularMovies(page: page)
            .trackError(errorTracker)
            .trackActivity(activityIndicator)
            .sink { response  in
                if let movieList = response.results {
                    self.poppularMovieList.append(contentsOf: movieList)
                }
            }
            .store(in: &bag)
    }
    
    func setMock() {
        useCase.getMockData()
            .trackActivity(activityIndicator)
            .sink { response in
                if let response = response, let movieList = response.results  {
                    self.poppularMovieList.append(contentsOf: movieList)
                    print(movieList)
                }
            }
            .store(in: &bag)
    }
    
    
    func setUpTagButtonData() {
        let genres = self.getAllGenres()
        var tag = [TagButtonStateProvider]()
        
        for genre in genres {
            tag.append(.init(title: genre.name ?? "", tag: genre.id ?? 0))
        }
        
        self.radioTagProvider = tag
    }
    
    func getGenre(movie: MovieModel) -> [String] {
        let data: GenreWrapper? = Common.loadJSONFileToObject(fileName: "genreId")
        var genreString = [String]()
        if let genreIds = data?.genre, let genre_ids = movie.genre_ids {
            for genreId in genre_ids {
                let genre = genreIds.first(where: { $0.id == genreId })
                genreString.append(genre?.name ?? "")
            }
        }
        return genreString
    }
    
    func getAllGenres() -> [GenreMovieModel] {
        let data: GenreWrapper? = Common.loadJSONFileToObject(fileName: "genreId")
        if let genreData = data?.genre {
            return genreData
        }
        return []
    }
}



struct TagButtonStateProvider: Identifiable {
    let title: String
    let id: Int
    var isSelected: Bool
    
    init(title: String, tag: Int ,isSelected: Bool = false) {
        self.title = title
        self.isSelected = isSelected
        self.id = tag
    }
}
