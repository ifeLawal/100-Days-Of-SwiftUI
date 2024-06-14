//
//  ContentView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/14/24.
//

import SwiftUI

struct TesterContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    @StateObject var citySearchViewModel = CitySearchViewModel()
    @StateObject var viewModel = WeatherViewModel()
    @State private var showingSearchView = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Display search view
                /*
                CitySearchView(viewModel: citySearchViewModel, weatherViewModel: weatherViewModel)
                // SearchView(viewModel: viewModel)
                 */
                
                /*
                NavigationLink(
                    destination: WeatherDetailView(viewModel: weatherViewModel),
                    label: {
                        Text("View Selected Cities Weather")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                )
                .padding()
                 */
                // Display weather details view
                // WeatherDetailView(weatherData: viewModel.weatherData)
                
                WeatherDetailView(viewModel: weatherViewModel)
                Spacer()
                Button(action: {
                    showingSearchView = true
                }) {
                    Text("Search City")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .sheet(isPresented: $showingSearchView) {
                    CitySearchView(viewModel: citySearchViewModel, weatherViewModel: weatherViewModel, isPresented: $showingSearchView)
                }
                /*
                NavigationLink(
                    destination: CitySearchView(viewModel: citySearchViewModel, weatherViewModel: weatherViewModel),
                    label: {
                        Text("Add New City Weather")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                )
                .padding()
                 */
            }
            .navigationTitle("Weather App")
        }
    }
}

#Preview {
    TesterContentView()
}
