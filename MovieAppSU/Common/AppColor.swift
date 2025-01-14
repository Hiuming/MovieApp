//
//  AppColor.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 28/11/24.
//

import SwiftUI
import Foundation

extension ShapeStyle where Self == Color {
    static var primaryPurple: Color {
        return .init(hex: "#B557FF")
    }
    
    static var primaryBlack: Color {
        return .init(hex: "#000000")
    }
    
    static var primaryBackground: Color {
        return .init(hex: "#181819")
    }
    
    static var primaryWhite: Color {
        return .init(hex: "#FFFFFF")
    }
    
    static var secondaryGrey: Color {
        return .init(hex: "#767E85")
    }
    
    static var subtitleGrey: Color {
        return .init(hex: "#BAC6D0")
    }
    
    static var primary: Color {
        return .primaryBlack
    }
    
}

