//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/14/24.
//

import Foundation
import Combine
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: [String: ResponseBody] = [:]
    @Published var fiveDayWeatherData: ResponseBodyFiveDay?
    @Published var selectedCity: String = ""
    @Published var searchResults: [String] = []
    @Published var selectedCities: [City] = [] {
        didSet {
            saveSelectedCities()
        }
    }
    @Published var state: FetchState<[String]> = .idle
    
    private var cancellables = Set<AnyCancellable>()
    private let weatherManager: WeatherManagerProtocol
    private let selectedCitiesKey = "SelectedCitiesKey"
    
    init(weatherManager: WeatherManagerProtocol = WeatherManager()) {
        self.weatherManager = weatherManager
        loadSelectedCities()
        let cities = previewCityList
        state = .success
        
        $selectedCity
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.searchResults = cities.filter { $0.lowercased().contains(query.lowercased()) }
            }
            .store(in: &cancellables)
    }

    func fetchWeather(for city: String) async throws {
        // Perform API request to fetch weather data for the given city
        // Update weatherData property with the fetched data
        // This involve using URLSession
        self.state = .loading
        weatherData[city] = try await weatherManager.getCurrentWeather(city: city)
        
        self.state = .success
        // mockData option
        // weatherData[city] = previewCityWeather
    }
    
    func fetchFiveDayForecast(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws {
        // Perform API request to fetch weather forecast data for coordinates
        // Update fiveDayWeatherData with the fetched data
        // This involve using URLSession
        self.state = .loading
        print("Arrived in fetch five day forecast")
        do {
            let response = try await weatherManager.getFiveDayWeatherForecast(longitude: longitude, latitude: latitude)
            print("Attempting to fetch")
            DispatchQueue.main.async {
                self.fiveDayWeatherData = response
                self.state = .success
            }
        } catch {
            DispatchQueue.main.async {
                print("\(error)")
                self.state = .failure(error)
            }
        }
        // mockData option
        // weatherData[city] = previewFiveDayWeather
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
    
    private func saveSelectedCities() {
        do {
            let encodedData = try JSONEncoder().encode(selectedCities)
            UserDefaults.standard.set(encodedData, forKey: selectedCitiesKey)
        } catch {
            print("Error encoding selected cities: \(error)")
        }
    }
    
    private func loadSelectedCities() {
        if let savedData = UserDefaults.standard.data(forKey: selectedCitiesKey) {
            do {
                selectedCities = try JSONDecoder().decode([City].self, from: savedData)
            } catch {
                print("Error decoding selected cities: \(error)")
            }
        }
    }
}
