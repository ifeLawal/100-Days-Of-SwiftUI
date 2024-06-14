//
//  SearchView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/14/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: WeatherViewModel = WeatherViewModel()
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false

    var body: some View {
        VStack {
            HStack {
                TextField("Search city...", text: $searchText, onEditingChanged: { isEditing in
                    isSearching = isEditing
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .onChange(of: searchText) { newValue in
                    viewModel.selectedCity = newValue
                }

                if isSearching {
                    Button("Cancel") {
                        searchText = ""
                        isSearching = false
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(isSearching)

            if isSearching && !viewModel.searchResults.isEmpty {
                List(viewModel.searchResults, id: \.self) { city in
                    Text(city)
                        .onTapGesture {
                            searchText = city
                            isSearching = false
                            viewModel.fetchWeather(for: city)
                        }
                }
                .frame(height: 200) // Adjust height as needed
            }
        }
    }
}

#Preview {
    SearchView()
}
