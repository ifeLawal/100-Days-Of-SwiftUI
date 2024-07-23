//
//  WeatherManager.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/29/24.
//

import Foundation
import CoreLocation

class WeatherManager: WeatherManagerProtocol {
    var baseUrl3 = "https://api.openweathermap.org/data/3.0/onecall"
    var baseUrl2 = "https://api.openweathermap.org/data/2.5/weather"
    var baseUrlForecast = "https://api.openweathermap.org/data/2.5/forecast"
    // 5 day forecast
    // https://openweathermap.org/forecast5#:~:text=Internal%20parameter
    // https://api.openweathermap.org/data/2.5/forecast?lat=40.7143&lon=-74.006&appid=&units=imperial
    // City forecast
    // https://openweathermap.org/current#:~:text=Longitude%20of%20the%20location
    // https://api.openweathermap.org/data/2.5/weather?q=New+York+City&appid=&units=imperial
    // Hourly
    // 
    // https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=44.34&lon=10.99&appid={API key}
    
    var appId = ""
    var useCelsius = "units=metric"
    var useFahrenheit = "units=imperial"
    
    func getCurrentWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: baseUrl3 + "?lat=\(latitude)&lon=\(longitude)&appid=\(appId)&\(useCelsius)") else {
            fatalError("Missing url")
        }
        
        return try await fetchData(from: url, type: ResponseBody.self)
    }
    
    func getFiveDayWeatherForecast(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBodyFiveDay {
        // ?lat=40.7143&lon=-74.006&appid=&units=imperial
        guard let url = URL(string: baseUrlForecast + "?lat=\(latitude)&lon=\(longitude)&appid=\(appId)&\(useCelsius)") else {
            fatalError("Missing url")
        }
        
        return try await fetchData(from: url, type: ResponseBodyFiveDay.self)
    }
    
    func getCurrentWeather(city: String) async throws -> ResponseBody {
        guard let url = URL(string: baseUrl2 + "?q=\(city)&appid=\(appId)&\(useFahrenheit)") else {
            fatalError("Missing url")
        }
        
        return try await fetchData(from: url, type: ResponseBody.self)
    }
    
    func fetchData<T: Decodable>(from url: URL, type: T.Type) async throws -> T {
        var urlRequest = URLRequest(url: url)
        
        var (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
