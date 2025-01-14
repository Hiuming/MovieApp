//
//  Common.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 26/11/24.
//

import Foundation
import SwiftMessages
import SwiftUI
import ObjectMapper

class Common {
    static let baseURL: String = "https://api.themoviedb.org/3"
    static func showError(_ error: Error?) {
        
    }
    
    @MainActor
    static func showMessageError(message: String, type: Theme = .error) {
        SwiftMessages.show {
            let view = MessageView.viewFromNib(layout: .tabView)
            view.configureTheme(type)
            view.configureContent(title: "", body: message)
            view.configureDropShadow()
            view.button?.isHidden = true
            return view
        }
    }
    
    static func loadJSONFileToObject<T:Mappable>(fileName: String) -> T? {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("JSON file not found.")
            return nil
        }
        
        do {
            if let jsonData = try? Data(contentsOf: fileURL) {
                let any = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any]
                if let dict = any, let json = T.init(JSON: dict) {
                    print("\(json)")
                    return json
                }
            } else {
                print("Error decoding JSON")
                return nil
            }
        } catch {
            print("Error decoding JSON \(error)")
        }
        return nil
    }
    
    static func getImage(path: String, width: Int = 0) -> URL? {
        var widthString = ""
        if width > 0 {
            widthString = "w\(width)"
        } else {
            widthString = "original"
        }
        return URL(string: "https://image.tmdb.org/t/p/\(widthString)/".appending(path))
    }

}


//MARK: IMAGE FROM MOVIE DB


//MARK: IOS CHECKBOX
struct iOSCheckboxToggleStyle: ToggleStyle {
    var color: Color = .accentColor
    var selectedColor: Color = .accentColor
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundStyle(configuration.isOn ? selectedColor : color)
                configuration.label
            }
        })
    }
}


//MARK: FONT

extension Font {
    static var appTitle: Font {
        return Font.custom("IBMPlexSans-Medium", size: 14.0)
    }
    
    static var subHead: Font {
        return Font.custom("IBMPlexSans-Medium", size: 20.0)
    }
    
    static var subHead1: Font {
        return Font.custom("IBMPlexSans-Medium", size: 16.0)
    }
    
    static var subHead2: Font {
        return Font.custom("IBMPlexSans-Medium", size: 14.0)
    }
    
    
    static var subHead3: Font {
        return Font.custom("IBMPlexSans-Medium", size: 12.0)
    }
    
    static var subHead4: Font {
        return Font.custom("IBMPlexSans-Medium", size: 10.0)
    }
    
    static var appBody: Font {
        return Font.custom("IBMPlexSans-Medium", size: 16.0)
    }
    
    static var appBody1: Font {
        return Font.custom("IBMPlexSans-Regular", size: 14.0)
    }
    
    static var appBody2: Font {
        return Font.custom("IBMPlexSans-Regular", size: 12.0)
    }
    
    static var appBody3: Font {
        return Font.custom("IBMPlexSans-Regular", size: 8.0)
    }
    

    
    static var buttonTitle: Font {
        return Font.custom("IBMPlexSans-Medium", size: 18.0)
    }
    
    static var app40pxMedium: Font {
        return Font.custom("IBMPlexSans-Medium", size: 40.0)
    }
    
    static var heading6: Font {
        return Font.custom("IBMPlexSans-Bold", size: 18.0)
    }
}

