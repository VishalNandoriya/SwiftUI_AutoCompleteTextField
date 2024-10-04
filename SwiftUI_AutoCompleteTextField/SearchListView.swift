//
//  SearchListView.swift
//  SwiftUI_AutoCompleteTextField
//
//  Created by Vishal Nandoriya on 04/10/24.
//

import SwiftUI

struct SearchListView: View {
    var filteredSuggestions: [String]
    var completionHandler: ((String) -> Void)?
    let cellHeight: CGFloat = 44
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filteredSuggestions, id: \.self) { suggestion in
                        HStack {
                            Text("\(suggestion)").foregroundStyle(.black)
                            Spacer()
                        }.contentShape(Rectangle())
                        .frame(height: cellHeight).padding(.horizontal)
                            .onTapGesture {
                                completionHandler?(suggestion)
                            }
                            
                        Divider()
                    }
                }
            }
        }
        .frame(height: filteredSuggestions.count < 5 ? CGFloat(Int(cellHeight) * filteredSuggestions.count) : (cellHeight * 5))
        .background(Color(UIColor.lightGray))
        .cornerRadius(4)
    }
}
