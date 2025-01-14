//
//  SearchBar.swift
//  MovieAppSU
//
//  Created by Huynh Minh Hieu on 29/11/24.
//
import SwiftUI
import Foundation

struct SearchBar: View {
    @Binding var searchText: String
    var hasCancel: Bool = true
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .primary
    var borderColor: Color = .primaryBlack
    var foregroundTextColor: Color = .primaryBlack
    var action: ()->()
    var onCancel: ()->()
    private let placeHolder = "Type something here ..."
    @FocusState private var isTextFieldFocused: Bool
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Spacer()
                    TextField("", text: $searchText, prompt:
                                Text(placeHolder)
                        .foregroundStyle(Color.subtitleGrey))
                    .frame(height: 56)
                    .textFieldStyle(.plain)
                    .foregroundStyle(foregroundTextColor)
                    .cornerRadius(12)
                    .onChange(of: searchText) { oldValue, newValue in
                        action()
                    }
                    .padding(.leading,10)
                    .focused($isTextFieldFocused)
                }
                .background(backgroundColor)
                .roundedBorder(cornerRadius: 28, lineWidth: 1, borderColor: isTextFieldFocused ? Color.primaryPurple : borderColor)
                
                
            }
            if hasCancel {
                Button(action: {
                    searchText = ""
                    onCancel()
                }) {
                    Text("Cancel")
                        .foregroundColor(foregroundColor)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut(duration: 1.0), value: UUID())
            }
        }
    }
}

#Preview {
    @Previewable @State var searchText: String = ""
    @Previewable @State var hasCancel: Bool = true
    SearchBar(searchText: $searchText, hasCancel: hasCancel) {
        
    } onCancel: {
        
    }

}
