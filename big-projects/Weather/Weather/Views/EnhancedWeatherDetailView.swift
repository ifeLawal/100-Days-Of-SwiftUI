//
//  EnhancedWeatherDetailView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/27/24.
//

import SwiftUI

struct EnhancedWeatherDetailView: View {
    @ObservedObject var viewModel: WeatherViewModel = WeatherViewModel()
    // let weatherData: WeatherData?
    @State private var navigateToCityDetail = false
    @State private var cityName = "New York"
    @State private var buttonText = "More info"

    var body: some View {
        VStack {
            if viewModel.selectedCities.isEmpty {
                Spacer()
                Text("No cities selected")
                    // .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding([.top], 20)
                Spacer()
            } else {
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        // https://stackoverflow.com/questions/61853323/swiftui-cannot-convert-value-of-type-bool-to-expected-argument-type-binding
                        ForEach($viewModel.selectedCities) { $city in
                            VStack(alignment: .leading) {
                                if let weatherData = viewModel.weatherData[city.name] {
                                    CardView(
                                        foregroundColor: .white,
                                        backgroundColor: CustomColors.cardBackgroundColor, padding: 5,
                                        weatherData: weatherData)
                                } else {
                                    Text("Loading...")
                                        .runAsyncTask({
                                            try await viewModel.fetchWeather(for: city.name)
                                        }, onError: { error in
                                            print("Error fetching weather: \(error)")
                                        })
                                }
                                HStack {
                                    Button(action: {
                                        cityName = city.name
                                        Task {
                                                try await viewModel.fetchFiveDayForecast(
                                                    longitude: viewModel.weatherData[cityName]?.coord.lon ?? 0,
                                                    latitude: viewModel.weatherData[cityName]?.coord.lat ?? 0
                                                )
                                                if viewModel.fiveDayWeatherData != nil {
                                                    buttonText = "More info"
                                                    navigateToCityDetail = true
                                                } else {
                                                    buttonText = "Failure. Try again"
                                                }
                                            }
                                    }) {
                                        Text(buttonText)
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
                            .padding(20)
                            .foregroundColor(.white)
                            .background(CustomColors.cardBackgroundColor)
                            .cornerRadius(25)
                        }
                    }
                }
            }
        }
        
        NavigationLink(destination: SingleLocationWeatherView(response: viewModel.fiveDayWeatherData, city: cityName), isActive: $navigateToCityDetail) {
                        EmptyView()
                    }.hidden() // Hidden navigation link to trigger programmatically
    }
}

#Preview {
    // WeatherData(city: "NYC", temperature: 25.0, condition: "Sunny")
    let viewModel = WeatherViewModel()
    viewModel.selectedCities = [
        City(name: "New York"),
        City(name: "Los Angeles")
    ]
    return EnhancedWeatherDetailView(viewModel: viewModel)
}
