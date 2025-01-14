//
//  BaseView.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//


import SwiftUI
struct BaseView<Content:View> : View {
   
    let screenName: String
    var isShowing: Bool = false
    init(screenName: String ,isLoading: Bool = false,@ViewBuilder content: () -> Content) {
        self.screenName = screenName
        self.content = content()
        self.isShowing = isLoading
    }
    let content: Content
    var body: some View {
        GeometryReader { geometry in
                 ZStack(alignment: .center) {
                     self.content
                         .disabled(self.isShowing)
                         .blur(radius: self.isShowing ? 3 : 0)
                     VStack {
                         ProgressView()
                     }
                     .frame(width: geometry.size.width / 2,
                            height: geometry.size.height / 5)
                     .background(Color.secondary.colorInvert())
                     .foregroundColor(Color.primary)
                     .cornerRadius(20)
                     .opacity(self.isShowing ? 1 : 0)

                 }
             }
            .onAppear {
                Log.info("Appear View: \(self.screenName)")
            }
    }
}
