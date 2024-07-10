#  <#Title#>

Inside of EnhancedWeatherDetailView, we previously had:

                                    Text("Loading...")
                                        .onAppear {
                                            Task {
                                                do {
                                                    try await viewModel.fetchWeather(for: city.name)
                                                } catch {
                                                    print("Error fetching weather: \(error)")
                                                }
                                            }
                                        }

Which has now been upgraded to use the view extension:

extension View {    
    func runAsyncTask(_ action: @escaping () async throws -> Void, onError: @escaping (Error) -> Void = { _ in }) -> some View {
        self.onAppear {
            Task {
                do {
                    try await action()
                } catch {
                    onError(error)
                }
            }
        }
    }
}

                                    Text("Loading...").
                                        runAsyncTask({
                                                    try await viewModel.fetchWeather(for: city.name)
                                                }, onError: { error in {
                                                    print("Error fetching weather: \(error)")
                                                }
                                            })
                                        }

When you have a binding, you can either use a wrappedValue to pull the unbound properties

                        ForEach($viewModel.selectedCities) { city in
                            VStack(alignment: .leading) {
                                Text(city.name.wrappedValue)
                                    .font(.headline)
                                if let weatherData = viewModel.weatherData[city.name.wrappedValue] {
                                    Text("Temperature: \(weatherData.main.temp)°C")
                                    Text("Condition: \(weatherData.weather[0].main)")

or you can make the individual object thats used in the loop binded:

                        ForEach($viewModel.selectedCities) { $city in
                            VStack(alignment: .leading) {
                                if let weatherData = viewModel.weatherData[city.name] {
                                    CardView(
                                        foregroundColor: .white,
                                        backgroundColor: CustomColors.cardBackgroundColor, padding: 5,
                                        weatherData: weatherData)
                                } else {
                                    Text("Loading...")



WeatherDetailView Archived code:

//
//  WeatherDetailView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/14/24.
//

import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var viewModel: WeatherViewModel = WeatherViewModel()
    // let weatherData: WeatherData?
    @State private var navigateToCityDetail = false
    @State private var cityName = "New York"

    var body: some View {
        VStack {
            if viewModel.selectedCities.isEmpty {
                Text("No cities selected")
            } else {
                ScrollView(.horizontal) {
                    VStack(spacing: 20) {
                        // https://stackoverflow.com/questions/61853323/swiftui-cannot-convert-value-of-type-bool-to-expected-argument-type-binding
                        ForEach($viewModel.selectedCities) { city in
                            VStack(alignment: .leading) {
                                Text(city.name.wrappedValue)
                                    .font(.headline)
                                if let weatherData = viewModel.weatherData[city.name.wrappedValue] {
                                    Text("Temperature: \(weatherData.main.temp)°C")
                                    Text("Condition: \(weatherData.weather[0].main)")
                                } else {
                                    Text("Loading...")
                                        .runAsyncTask({
                                            try await viewModel.fetchWeather(for: city.name.wrappedValue)
                                        }, onError: { error in
                                                print("There was an error: \(error)")
                                        })
                                }
                                HStack {
                                    Button(action: {
                                        cityName = city.name.wrappedValue
                                        navigateToCityDetail = true
                                    }) {
                                        Text("More info")
                                            .foregroundColor(.blue)
                                            .padding(10)
                                            .background(Color(.systemGray5)).cornerRadius(8)     .shadow(radius: 5)
                                    }
                                    Button(action: {
                                        viewModel.removeCity(city.wrappedValue)
                                    }) {
                                        Text("Remove")
                                            .foregroundColor(.red)
                                            .padding(10)
                                            .background(Color(.systemGray5)).cornerRadius(8)     .shadow(radius: 5)
                                    }
                                }
                            }
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                            .shadow(radius: 5)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Weather Details")
        
        NavigationLink(destination: CityDetailView(city: cityName), isActive: $navigateToCityDetail) {
                        EmptyView()
                    }.hidden() // Hidden navigation link to trigger programmatically
        
        
        /*
        alternative as just one weather view
        if let weatherData = weatherData {
            VStack {
                Text("City: \(weatherData.city)")
                Text("Temperature: \(weatherData.temperature)°C")
                Text("Condition: \(weatherData.condition)")
            }
        } else {
            Text("No weather data available")
        }
         */
    }
}

#Preview {
    // WeatherData(city: "NYC", temperature: 25.0, condition: "Sunny")
    let viewModel = WeatherViewModel()
    viewModel.selectedCities = [
        City(name: "New York"),
        City(name: "Los Angeles")
    ]
    return WeatherDetailView(viewModel: viewModel)
}

// CityDetailView
//
//  CityDetailView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import SwiftUI

struct CityDetailView: View {
    let city: String

    var body: some View {
        VStack {
            Text("Weather Details for \(city)")
                .font(.largeTitle)
                .padding()

            // Add more detailed weather information here
        }
        .navigationTitle(city)
    }
}

#Preview {
    CityDetailView(city: "New York City")
}


// TesterContentView

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

