//
//  CitySearchView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import SwiftUI

struct CitySearchView: View {
    @ObservedObject var viewModel: CitySearchViewModel = CitySearchViewModel()
    @ObservedObject var weatherViewModel: WeatherViewModel = WeatherViewModel()
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    @State private var showCityDetail: Bool = false
    @State private var selectedCity: City?
    // @State private var navigateToWeatherDetail: Bool = false // State variable for navigation
    @Binding var isPresented: Bool // Binding to control the presentation

    var body: some View {
        VStack {
            HStack {
                TextField("Search city...", text: $searchText, onEditingChanged: { isEditing in
                    isSearching = isEditing
                    if isEditing {
                        viewModel.searchCity(query: searchText)
                    }
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .onChange(of: searchText) { newValue in
                    viewModel.searchCity(query: newValue)
                }

                if isSearching {
                    Button("Cancel") {
                        searchText = ""
                        isSearching = false
                        isPresented = false
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(isSearching)

            if isSearching && !viewModel.searchResults.isEmpty {
                List(viewModel.searchResults) { city in
                    HStack {
                        Text(city.name)
                        Spacer()
                        Button(action: {
                            searchText = city.name
                            isSearching = false
                            selectedCity = city
                            weatherViewModel.addCity(city)
                            // navigateToWeatherDetail = true
                            isPresented = false
                        }) {
                            Text("Add")
                                .foregroundColor(.blue)
                        }
                    }
                    /*
                     alternative for single search (no adding to a list)
                     Text(city.name)
                        .onTapGesture {
                            searchText = city.name
                            isSearching = false
                            weatherViewModel.fetchWeather(for: city.name)
                            selectedCity = city
                            showCityDetail = true
                        } */
                }
                .frame(height: 200) // Adjust height as needed
            }
            
            /* https://stackoverflow.com/questions/73036878/navigationlink-isactive-deprecated#:~:text=New%20way%20to
            NavigationLink(destination: WeatherDetailView(viewModel: weatherViewModel), isActive: $navigateToWeatherDetail) {
                            EmptyView()
                        }.hidden() // Hidden navigation link to trigger programmatically
             */

            NavigationLink(
                destination: WeatherDetailView(viewModel: weatherViewModel),
                // destination: CityDetailView(city: selectedCity?.name ?? ""),
                isActive: $showCityDetail,
                label: {
                    EmptyView()
                })
        }
        Spacer()
    }
}

#Preview {
    CitySearchView(isPresented: .constant(true))
}
