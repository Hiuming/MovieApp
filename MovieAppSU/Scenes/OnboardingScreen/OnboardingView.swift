//
//  OnboardingView.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 2/12/24.
//

import SwiftUI
import Foundation
import Stinsen

struct OnboardingView: View {
    @EnvironmentObject private var mainCoordinator: MainCoordinator.Router
    var body: some View {
        BaseView(screenName: "OnboardingView") {
            ZStack {
                Color.primaryBlack.ignoresSafeArea()
                VStack {
                    ZStack {
                        Image(ImageResource.imgOnboard)
                            .resizable()
                            .ignoresSafeArea()
                        LinearGradient(
                            colors: [Color.primaryBlack.opacity(0.2), Color.primaryBlack.opacity(0.0),
                                     Color.primaryBlack.opacity(0.6)], startPoint: .top,
                            endPoint: .bottom)
                        .ignoresSafeArea()
                    }
                    .mask {
                        LinearGradient(gradient: Gradient(colors: [.primaryBlack, .primaryBlack, .primaryBlack, .clear]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea()
                    }
                    OnboardingTextView()
                    Spacer(minLength: 24)
                    HStack {
                        Spacer()
                        PrimaryButton(title: "Continue",
                                      width: 200,
                                      onPress: {
                            mainCoordinator
                                .root(\.login)
                        })
                    }.padding(.horizontal,24)
                }
                
            }
        }
    }
}


struct OnboardingTextView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Discover Unlimited Movies & Shows")
                .foregroundStyle(Color.primaryWhite)
                .font(.app40pxMedium)
                .multilineTextAlignment(.center)
            Text("Enter a world of limitless entertainment with thousands of movies and series across genres. Whether you’re looking for the latest blockbusters, inspiring indie films, or all-time classics, we’ve got it all. Find the titles you love the most and let us take you on an unforgettable cinematic journey.")
                .foregroundStyle(Color.primaryWhite)
                .font(.subHead2)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal,24)
    }
}


#Preview {
    OnboardingView()
}
