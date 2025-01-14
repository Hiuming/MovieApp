//
//  LoginView.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 29/11/24.
//

import Foundation
import SwiftUI
import Stinsen
import SwiftMessages


struct LoginView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject private var loginCoordinator: LoginCoordinator.Router
    @State var userName = ""
    @State var password = ""
    var body: some View {
        BaseView(screenName: "LoginView", isLoading: viewModel.isLoading) {
            ZStack {
                Color.primaryBlack.ignoresSafeArea()
                VStack {
                    Image(ImageResource.imgBgLogin)
                        .resizable()
                        .ignoresSafeArea()
                        .frame(height: UIScreen.main.bounds.height * 0.48)
                    Spacer()
                }
            }
            .overlay(alignment: .top, content: {
                VStack {
                    Spacer()
                    Text("Login Now!")
                        .font(.app40pxMedium)
                        .foregroundStyle(Color.primaryWhite)
                    Text("Please enter your details")
                        .font(.appBody1)
                        .foregroundStyle(Color.primaryWhite)
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.285)
            })
            .overlay(alignment: .bottom) {
                ZStack {
                    Color.primaryBlack.ignoresSafeArea()
                    VStack {
                        LoginTile(title: "Your Email",text: $userName,
                                  placeHolder: "Email",isPassword: false)
                        LoginTile(title: "Password",text: $password,placeHolder: "Password", isPassword: true)
                        RememberPasswordView()
                        PrimaryButton(title: "Login",width: .infinity) {
                            viewModel.login(userName: userName, password: password) { success in
                                if success {
                                    loginCoordinator.root(\.loggedIn)
                                } else {
                                   
                                }
                            }
                        }
                        Spacer(minLength: 24)
                        LoginWithSocialView()
                        Spacer(minLength: 24)
                        HStack {
                            Text("Does not have an account ?")
                                .font(.subHead2)
                                .foregroundStyle(Color.subtitleGrey)
                            Text("Sign Up")
                                .font(.appBody)
                                .foregroundStyle(Color.primaryPurple)
                            
                        }
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical,30)
                    
                }
                .frame(height: UIScreen.main.bounds.height * 0.6)
                .cornerRadius(30)
                .ignoresSafeArea()
            }
        }
    }
    
}


struct RememberPasswordView: View {
    @State private var isChecked: Bool = false
    var body: some View {
        HStack {
            Toggle(isOn: $isChecked) {
                Text("Remember me")
                    .foregroundStyle(Color.primaryWhite)
                    .font(.appBody1)
            }
            .toggleStyle(
                iOSCheckboxToggleStyle(color: .primaryWhite)
            )
            Spacer()
            Text("Forgot password?")
                .foregroundStyle(Color.primaryPurple)
                .font(.appBody1)
        }
        .padding(.vertical,12)
    }
}


struct LoginTile: View {
    var title: String
    @Binding var text: String
    var placeHolder: String
    var isPassword: Bool
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(title)
                .font(.appBody1)
                .foregroundStyle(Color.primaryWhite)
            if isPassword {
                AppPasswordField(text: $text, placeHolder: placeHolder, borderColor: .subtitleGrey)
            } else {
                AppTextField(text:$text, placeHolder: placeHolder,borderColor: .subtitleGrey)
            }
        }
    }
}

struct LoginWithSocialView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.subtitleGrey)
                    .frame(height: 0.5)
                Text("Or login with")
                    .foregroundStyle(Color.subtitleGrey)
                    .font(.appBody2)
                Rectangle()
                    .fill(Color.subtitleGrey)
                    .frame(height: 0.5)
            }
            Spacer(minLength: 18)
            HStack(spacing: 56) {
                SocialCircleView(title: "Google")
                SocialCircleView(title: "Netflix")
                SocialCircleView(title: "Apple ID")
            }
        }
    }
}

struct SocialCircleView: View {
    var title: String
    var body: some View {
        VStack {
            ZStack {
                Color.primaryPurple.ignoresSafeArea()
                Text(title.first!.description)
                    .font(.heading6)
                    .foregroundStyle(Color.primaryWhite)
            }
            .frame(width: 56,height: 56)
            .cornerRadius(28, corners: .allCorners)
            Text(title)
                .font(.subHead2)
                .foregroundStyle(Color.primaryWhite)
        }
    }
    
    
}

#Preview {
    LoginView().environmentObject(LoginViewModel())
}
