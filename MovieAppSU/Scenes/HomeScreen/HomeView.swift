//
//  HomeView.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 29/11/24.
//

import SwiftUI
import Foundation
import Combine
import SkeletonUI

struct HomeView: View {
    @State private var searchText = ""
    //TODO: Login state here
    @State private var isLogin = true
    @StateObject var viewModel = HomeViewModel()
    var mockView: Bool = false
    var body: some View {
        BaseView(screenName: "HomeView") {
            ScrollView {
                if isLogin {
                    ZStack {
                        Color.primaryBackground.ignoresSafeArea(.all)
                        VStack(alignment: .leading) {
                            Spacer(minLength: 60)
                            HomeHeaderView()
                                .padding(.horizontal, 20)
                            SearchBar(searchText: $searchText,hasCancel: false,borderColor: .primaryWhite,foregroundTextColor: .primaryWhite) { text in
                                
                            } onCancel: {
                                
                            }
                            .padding(.horizontal, 18)
                            HomeSuggestMovie(movie: viewModel.discoverMovies.first,viewModel: viewModel)
                            Spacer(minLength: 10)
                            ScrollView(.horizontal) {
                                LazyHStack(spacing: 0) {
                                    ForEach(viewModel.discoverMovies) { movie in
                                        MovieTiles(movie: movie,genre: viewModel.getGenre(movie: movie))
                                    }
                                }
                            }
                            Section {
                                Text("Popular")
                                    .font(.heading6)
                                    .foregroundStyle(.primaryWhite)
                                    .padding(.leading,20)
                                PopularMovieList(movies: viewModel.poppularMovieList, viewModel: viewModel)
                            }
                        }
                    }
                    .onAppear {
                        viewModel.setUpTagButtonData()
                        if mockView {
                            viewModel.setMock()
                        } else {
                            viewModel.getPopularMovies()
                            viewModel.getDiscoverMovies()
                        }
                    }
                    
                } else {
                    VStack {
                        Text("Login")
                        Button("Login") {
                            isLogin.toggle()
                        }
                    }
                }
            }
        }
        .background(.primaryBackground)
        .ignoresSafeArea(edges: .all)
    }
}

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello,")
                    .foregroundStyle(.subtitleGrey)
                    .font(.subHead2)
                Text("Hieu Huynh")
                    .foregroundStyle(.primaryWhite)
                    .font(.subHead)
            }
            Spacer()
            Image(ImageResource.icSvgSetting)
        }
    }
}

struct HomeSuggestMovie: View {
    var movie: MovieModel?
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            if let url = Common.getImage(path: movie?.backdrop_path ?? "") {
                AsyncImage(url: url) { image in
                    image.image?
                        .resizable()
                        .skeleton(with: image.image == nil)
                }
                .mask {
                    VStack(spacing: 0) {
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "#191A2C00"), Color(hex: "#171616")]), startPoint: .top, endPoint: .bottom)
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "#191A2C00"), Color(hex: "#171616")]), startPoint: .bottom, endPoint: .top)
                    }
                }
                .frame(width: UIScreen.main.bounds.width,height: 310)
                .overlay(alignment: .bottomLeading) {
                    Text("On Trending")
                        .font(.heading6)
                        .foregroundStyle(.primaryWhite)
                        .padding(.leading,20)
                }
            } else {
                Color.subtitleGrey.frame(width: UIScreen.main.bounds.width,height: 310)
            }
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach($viewModel.radioTagProvider) { $tagData in
                            TagButton(title: tagData.title, onPress: {
                                tagData.isSelected.toggle()
                                print(tagData.isSelected)
                            }, isSelected: tagData.isSelected)
                                .padding(.leading,10)
                        }
                    }
                }
                .padding(.top, 30)
                .scrollIndicators(.hidden)
                Spacer()
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Group {
                                Text(movie?.title ?? "None")
                                    .foregroundStyle(.primaryWhite)
                                    .font(.subHead)
                                    .padding(.top,10)
                                Text(movie?.release_date ?? "None")
                                    .foregroundStyle(.primaryWhite)
                                    .font(.appBody1)
                                    .padding(.bottom,10)
                            }
                            .padding(.leading,20)
                            
                            
                        }
                        Spacer()
                        PrimaryButton(
                            title: "Watch Now",onPress:  {
                                
                            }, backgroundColor: .clear,borderWidth: 2.0, borderColor: .primaryPurple,
                            textColor: .primaryPurple)
                        .padding(.trailing,20)
                        .padding(.vertical,10)
                    }
                }
                .background(Color.white.opacity(0.1))
                .cornerRadius(30)
                .padding(.horizontal,18)
                .padding(.bottom,30)
                .ignoresSafeArea(.all)
            }
        }
    }
}


struct MovieTiles: View  {
    var movie: MovieModel?
    var genre: [String]
    var body: some View {
        VStack(alignment: .leading) {
            if let url = Common.getImage(path: movie?.backdrop_path ?? "",width: 500) {
                AsyncImage(url: url) { image in
                    image.image?
                        .resizable()
                        .skeleton(with: image.image == nil)
                }
                .frame(height: 200)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
            } else {
                Color.subtitleGrey.frame(width: UIScreen.main.bounds.width,height: 310)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(movie?.title ?? "")
                        .font(.subHead2)
                        .foregroundStyle(.primaryWhite)
                    Text(genre.joined(separator: "/ "))
                        .font(.appBody2)
                        .foregroundStyle(.subtitleGrey)
                }
                VStack {
                    Spacer()
                    HStack {
                        Image(ImageResource.icStarVote)
                        Text("\(movie?.vote_average ?? 0.0,specifier: "%.1f")")
                            .font(.appBody2)
                            .foregroundStyle(.subtitleGrey)
                    }
                }
            }
        }
        .frame(maxWidth: 153)
        .padding(.leading, 18)
        .skeleton(with: movie == nil)
    }
}

struct MovieVerticalTiles: View {
    var movie: MovieModel?
    var genre: [String]
    var body: some View {
        HStack {
            if let url = Common.getImage(path: movie?.backdrop_path ?? "",width: 500) {
                AsyncImage(url: url) { image in
                    image.image?
                        .resizable()
                        .skeleton(with: image.image == nil)
                }
                .frame(height: 128)
                .frame(idealWidth: 100)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
            } else {
                Color.subtitleGrey.frame(width: UIScreen.main.bounds.width,height: 310)
            }
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(movie?.title ?? "")
                        .font(.subHead2)
                        .foregroundStyle(.primaryWhite)
                    Spacer(minLength: 4)
                    Text(genre.joined(separator: "/ "))
                        .font(.appBody2)
                        .foregroundStyle(.subtitleGrey)
                        .skeleton(with: genre.isEmpty)
                    Spacer(minLength: 4)
                    Text(movie?.overview ?? "")
                        .font(.appBody2)
                        .foregroundStyle(.subtitleGrey.opacity(0.5))
                        .lineLimit(3)
                }
                HStack {
                    Image(ImageResource.icStarVote)
                    Text("\(movie?.vote_average ?? 0.0,specifier: "%.1f")")
                        .font(.appBody2)
                        .foregroundStyle(.subtitleGrey)
                        .skeleton(with: movie?.vote_average == 0.0)
                }
            }
        }
        .padding(.leading, 18)
        .frame(idealHeight: 130)
    }
}

struct PopularMovieList: View {
    var movies: [MovieModel]
    var viewModel: HomeViewModel
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(movies) { movie in
                MovieVerticalTiles(movie: movie, genre: viewModel.getGenre(movie: movie))
                    .padding(.bottom,20)
            }
            Spacer(minLength: 80)
        }
    }
}


#Preview {
    @Previewable @StateObject var viewModel = HomeViewModel()
    HomeView(mockView: true).environmentObject(viewModel)
}
