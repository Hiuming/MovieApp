//
//  SplashScreen.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 28/11/24.
//

import SwiftUI
import Foundation

struct SplashScreen: View {
    @State private var scale = 0.7
    @Binding var isActive: Bool
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image(ImageResource.appBanner)
                Text("Your Movies, Anytime, Anywhere")
                    .font(.system(size: 17))
                    .foregroundStyle(Color.primaryWhite)
            }.scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.7)) {
                        self.scale = 0.9
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            Spacer()
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [
            .primaryBlack.opacity(0.85),
            .primaryPurple.opacity(0.9),
            .primaryBlack.opacity(0.85)
        ]), startPoint: .topLeading, endPoint: .bottom))
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}



#Preview {
    @Previewable @State var isActive = false
    SplashScreen(isActive: $isActive)
}
