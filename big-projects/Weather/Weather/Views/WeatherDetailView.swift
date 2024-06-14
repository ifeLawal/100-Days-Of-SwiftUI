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
                        ForEach(viewModel.selectedCities) { city in
                            VStack(alignment: .leading) {
                                Text(city.name)
                                    .font(.headline)
                                if let weatherData = viewModel.weatherData[city.name] {
                                    Text("Temperature: \(weatherData.temperature)°C")
                                    Text("Condition: \(weatherData.condition)")
                                } else {
                                    Text("Loading...")
                                        .onAppear {
                                            viewModel.fetchWeather(for: city.name)
                                        }
                                }
                                HStack {
                                    Button(action: {
                                        cityName = city.name
                                        navigateToCityDetail = true
                                    }) {
                                        Text("More info")
                                            .foregroundColor(.blue)
                                            .padding(10)
                                            .background(Color(.systemGray5)).cornerRadius(8)     .shadow(radius: 5)
                                    }
                                    Button(action: {
                                        viewModel.removeCity(city)
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
