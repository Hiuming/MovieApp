//
//  BaseView.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 4/12/24.
//


import SwiftUI
struct BaseView<Content:View> : View {
    let content: Content
    let screenName: String
    init(screenName: String ,@ViewBuilder content: () -> Content) {
        self.screenName = screenName
        self.content = content()
    }
    
    var body: some View {
        content
            .onAppear {
                Log.info("Appear View: \(self.screenName)")
            }
    }
}
