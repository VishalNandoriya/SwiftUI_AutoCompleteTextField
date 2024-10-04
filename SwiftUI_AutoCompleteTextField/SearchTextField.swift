//
//  SearchTextField.swift
//  SwiftUI_AutoCompleteTextField
//
//  Created by Vishal Nandoriya on 04/10/24.
//

import SwiftUI

struct SearchTextField: View {
    
    @Binding var address: String
    @Binding var filteredSuggestions: [String]
    @Binding var searchText: String
    @State private var isListHide = true
    @FocusState var focusedField: Bool
    
    var placeHolder: String
    var completionHandler: (() -> Void)?
    
    var body: some View {
        VStack {
            TextField(placeHolder, text: $address)
                .autocapitalization(.words)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField)
                .onChange(of: focusedField) { oldValue, newValue in
                    if !newValue {
                        filteredSuggestions = []
                    }
                }
                .onChange(of: address) {
                    if isListHide {
                        searchText = address
                    } else {
                        isListHide = true
                    }
                    completionHandler?()
                }
                .overlay(
                    ZStack{
                        if !filteredSuggestions.isEmpty {
                            SearchListView(filteredSuggestions: filteredSuggestions) { selectedItem in
                                isListHide = false
                                address = selectedItem
                                searchText = ""
                            }
                        }
                    }.offset(y: 42), alignment: .topLeading)
        }.zIndex(1)
    }
}
