//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/14/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weatherData: [String: WeatherData] = [:]
    @Published var selectedCity: String = ""
    @Published var searchResults: [String] = []
    @Published var selectedCities: [City] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // For demonstration, let's use a hardcoded list of cities
        let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "London", "Paris", "Berlin", "Tokyo", "Beijing"]
        
        $selectedCity
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.searchResults = cities.filter { $0.lowercased().contains(query.lowercased()) }
            }
            .store(in: &cancellables)
    }

    func fetchWeather(for city: String) {
        // Perform API request to fetch weather data for the given city
        // Update weatherData property with the fetched data
        // This could involve using URLSession, Alamofire, or any other networking library
        // For simplicity, we'll use mock data here
        weatherData[city] = WeatherData(city: city, temperature: Double.random(in: 30...45), condition: "sun")
    }

    func updateSearchResults(_ results: [String]) {
        searchResults = results
    }
    
    func addCity(_ city: City) {
        if !selectedCities.contains(where: { $0.name == city.name }) {
            selectedCities.append(city)
        }
    }

    func removeCity(_ city: City) {
        selectedCities.removeAll { $0.id == city.id }
        weatherData.removeValue(forKey: city.name)
    }
}
