//
//  ContentView.swift
//  SwiftUI_AutoCompleteTextField
//
//  Created by Vishal Nandoriya on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var address: String = ""
    @State private var searchText: String = ""
    @State private var filteredSuggestions: [String] = []
    
    let suggestions: [String] = [
        "Apple Street", "Apricot Avenue", "Avocado Boulevard", "Banana Road", "Blackberry Lane",
        "Blueberry Drive", "Cantaloupe Street", "Cherry Avenue", "Coconut Boulevard", "Cranberry Road",
        "Date Lane", "Dragonfruit Drive", "Durian Street", "Elderberry Avenue", "Fig Boulevard",
        "Grape Road", "Grapefruit Lane", "Guava Drive", "Honeydew Street", "Jackfruit Avenue",
        "Kiwi Boulevard", "Lemon Road", "Lime Lane", "Lychee Drive", "Mango Street",
        "Mulberry Avenue", "Nectarine Boulevard", "Orange Road", "Papaya Lane", "Passionfruit Drive",
        "Peach Street", "Pear Avenue", "Persimmon Boulevard", "Pineapple Road", "Plum Lane",
        "Pomegranate Drive", "Raspberry Street", "Strawberry Avenue", "Tangerine Boulevard", "Watermelon Road"
    ]
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .autocapitalization(.words)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SearchTextField(address: $address, filteredSuggestions: $filteredSuggestions, searchText: $searchText, placeHolder: "Address") {
                filterSuggestions()
            }
            
            TextField("Phone Number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding()
        Spacer()
    }
    
    func filterSuggestions() {
        if searchText.isEmpty {
            filteredSuggestions = []
        } else {
            filteredSuggestions = suggestions.filter { $0.lowercased().contains(address.lowercased()) }
        }
    }
}


#Preview {
    ContentView()
}
