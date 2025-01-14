//
//  AppTextField.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 2/12/24.
//

import SwiftUI
struct AppTextField: View {
    @Binding var text: String
    var placeHolder: String
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .primary
    var borderColor: Color = .primaryBlack
    var foregroundTextColor: Color = .primaryWhite
    var trailingIcon: ImageResource?
    @FocusState private var isTextFieldFocused: Bool
    
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Spacer(minLength: 16)
                    TextField("", text: $text, prompt:
                                Text(placeHolder)
                        .foregroundStyle(Color.subtitleGrey)
                        .font(.appBody1)
                    )
                    .frame(height: 56)
                    .textFieldStyle(.plain)
                    .foregroundStyle(foregroundTextColor)
                    .cornerRadius(12)
                    .focused($isTextFieldFocused)
                    .autocapitalization(.none)
                    Spacer(minLength: 16)
                    
                }
                .background(backgroundColor)
                .roundedBorder(cornerRadius: 28, lineWidth: 1, borderColor: isTextFieldFocused ? Color.primaryPurple : borderColor)
            }
        }
    }
}

struct AppPasswordField: View {
    @Binding var text: String
    var placeHolder: String
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .primary
    var borderColor: Color = .primaryBlack
    var foregroundTextColor: Color = .primaryWhite
    @FocusState private var isTextFieldFocused: Bool
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Spacer(minLength: 16)
                    Group {
                        if showPassword {
                            TextField("", text: $text, prompt:
                                        Text(placeHolder)
                                .foregroundStyle(Color.subtitleGrey)
                                .font(.appBody1)
                            )
                        } else {
                            SecureField("", text: $text, prompt:
                                            Text(placeHolder)
                                        
                                .foregroundStyle(Color.subtitleGrey)
                                .font(.appBody1)
                            )
                        }
                    }
                    .frame(height: 56)
                    .textFieldStyle(.plain)
                    .foregroundStyle(foregroundTextColor)
                    .cornerRadius(12)
                    .focused($isTextFieldFocused)
                    .autocapitalization(.none)
                    Spacer()
                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                        .foregroundStyle(Color.primaryWhite)
                        .onTapGesture {
                            showPassword.toggle()
                        }
                    Spacer(minLength: 16)
                }
                .background(backgroundColor)
                .roundedBorder(cornerRadius: 28, lineWidth: 1, borderColor: isTextFieldFocused ? Color.primaryPurple : borderColor)
            }
        }
    }
    
    
}

#Preview {
    @Previewable @State var text: String = ""
    AppPasswordField(text: $text, placeHolder: "Type here")
        .preferredColorScheme(.dark)
}
