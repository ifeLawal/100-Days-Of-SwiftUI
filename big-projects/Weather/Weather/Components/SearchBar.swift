//
//  SearchBar.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 4/29/24.
//

import SwiftUI

struct SearchBar: View {
    var searchText: String = "Search for a city"
    var backgroundColor: Color = Color(hue: 1.0, saturation: 0.0, brightness: 0.888, opacity: 0.5)
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text(searchText)
        }
        .padding([.leading, .trailing], 20)
        .padding([.top, .bottom], 15)
        .frame(maxWidth: .infinity, alignment: .leading)
//        .foregroundColor(foregroundColor)
        .background(backgroundColor)
        .cornerRadius(50)
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    SearchBar()
}
