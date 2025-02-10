//
//  Button.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 2/12/24.
//

import SwiftUI
import Foundation

struct PrimaryButton: View {
    var title: String
    var width: CGFloat = 120.0
    var height: CGFloat = 56.0
    var onPress: () -> Void
    var backgroundColor: Color = .primaryPurple
    var borderWidth: CGFloat = 1.0
    var borderColor: Color = .primaryPurple
    var textColor: Color = .primaryWhite
    var body: some View {
        Button(action: onPress) {
            ZStack {
                backgroundColor
                Text(title)
                    .foregroundStyle(textColor)
                    .font(.buttonTitle)
            }
        }
        .frame(maxWidth: width, maxHeight: height)
        .cornerRadius(height/2)
        .overlay {
            RoundedRectangle(cornerRadius: height/2)
                .stroke(borderColor, lineWidth: borderWidth)
        }
        
    }
}

struct TagButton: View {
    var title: String
    var width: CGFloat = 45.0
    var height: CGFloat = 25.0
    var onPress: () -> Void
    var backgroundColor: Color = .primaryPurple
    var isSelected : Bool
   
    var body: some View {
        Button(action: onPress) {
            ZStack {
                isSelected ?  backgroundColor.opacity(0.3) : .primaryWhite.opacity(0.36)
                    Text(title)
                        .foregroundStyle(Color.primaryWhite)
                        .font(.appBody2)
                        .padding(.horizontal,10)
            }
        }
        .frame(minWidth: width, maxHeight: height)
        .cornerRadius(height/2)
    }
}


#Preview {
    
    @Previewable @State var isSelected: Bool = false
    PrimaryButton(title: "Button", onPress: {
        
    })
    
    TagButton(title: "Tag", onPress: {
        isSelected.toggle()
    }, isSelected: isSelected)
        .preferredColorScheme(.dark)
}
