//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Ifeoluwa Lawal on 7/23/24.
//

import XCTest
import Combine
import CoreLocation
@testable import Weather

final class WeatherViewModelTests: XCTestCase {

    var viewModel: WeatherViewModel!
        var cancellables: Set<AnyCancellable>!
        var mockWeatherManager: MockWeatherManager!

        override func setUp() {
            super.setUp()
            mockWeatherManager = MockWeatherManager()
            viewModel = WeatherViewModel(weatherManager: mockWeatherManager)
            cancellables = Set<AnyCancellable>()
        }

        override func tearDown() {
            viewModel = nil
            cancellables = nil
            mockWeatherManager = nil
            super.tearDown()
        }

        func testFetchWeather() async {
            // Given (Arrange)
            let city = "London"
            mockWeatherManager.currentWeatherResult = .success(previewCityWeather)

            // When (Act)
            do {
                try await viewModel.fetchWeather(for: city)
                // Then (Assert)
                XCTAssertNotNil(viewModel.weatherData[city])
                XCTAssertEqual(viewModel.weatherData[city]?.name, city)
            } catch {
                XCTFail("Expected success but got failure with error: \(error)")
            }
        }

        func testFetchFiveDayForecast() async {
            // Given (Arrange)
            let longitude: CLLocationDegrees = 40.7128
            let latitude: CLLocationDegrees = -74.0060
            mockWeatherManager.fiveDayWeatherForecastResult = .success(previewFiveDayWeather)

            do {
                // When (Act)
                try await viewModel.fetchFiveDayForecast(longitude: longitude, latitude: latitude)
                // Then (Assert)
                XCTAssertNotNil(viewModel.fiveDayWeatherData)
            } catch {
                XCTFail("Expected success but got failure with error: \(error)")
            }
        }

        func testAddCity() {
            let city = City(name: "Los Angeles")
            viewModel.addCity(city)
            XCTAssertTrue(viewModel.selectedCities.contains(where: { $0.name == city.name }))
        }

        func testRemoveCity() {
            let city = City(name: "Los Angeles")
            viewModel.addCity(city)
            viewModel.removeCity(city)
            XCTAssertFalse(viewModel.selectedCities.contains(where: { $0.name == city.name }))
        }

        func testSearchResultsUpdate() {
            viewModel.selectedCity = "New"
            let expectation = XCTestExpectation(description: "Search results updated")
            viewModel.$searchResults
                .dropFirst()
                .sink { results in
                    XCTAssertTrue(results.contains("New York"))
                    expectation.fulfill()
                }
                .store(in: &cancellables)
            wait(for: [expectation], timeout: 1.0)
        }
        
        // Work in progress on testing locally saved cities
        func testSaveAndLoadSelectedCities() {
            let city = City(name: "San Francisco")
            viewModel.addCity(city)
            
            let newViewModel = WeatherViewModel(weatherManager: mockWeatherManager)
            
            XCTAssertTrue(newViewModel.selectedCities.contains(where: { $0.name == city.name }))
        }
    }

    // Mock classes for testing
class MockWeatherManager: WeatherManagerProtocol {
        var currentWeatherResult: Result<ResponseBody, Error>?
        var fiveDayWeatherForecastResult: Result<ResponseBodyFiveDay, Error>?
        
        func getCurrentWeather(city: String) async throws -> ResponseBody {
            switch currentWeatherResult {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
            case .none:
                fatalError("currentWeatherResult is not set")
            }
        }
        
        func getFiveDayWeatherForecast(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBodyFiveDay {
            switch fiveDayWeatherForecastResult {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
            case .none:
                fatalError("fiveDayWeatherForecastResult is not set")
            }
        }
    
    func getCurrentWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBody {
        switch currentWeatherResult {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        case .none:
            fatalError("currentWeatherResult is not set")
        }
    }
}
