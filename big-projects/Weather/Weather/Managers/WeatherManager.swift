//
//  WeatherManager.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/29/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    var baseUrl3 = "https://api.openweathermap.org/data/3.0/onecall"
    var baseUrl2 = "https://api.openweathermap.org/data/2.5/weather"
    var appId = "hidden"
    var useCelsius = "units=metric"
    
    func getCurrentWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: baseUrl3 + "?lat=\(latitude)&lon=\(longitude)&appid=\(appId)&\(useCelsius)") else {
            fatalError("Missing url")
        }
        
        return try await getWeatherData(url: url)
    }
    
    func getCurrentWeather(city: String) async throws -> ResponseBody {
        guard let url = URL(string: baseUrl2 + "?q=\(city)&appid=\(appId)") else {
            fatalError("Missing url")
        }
        
        return try await getWeatherData(url: url)
    }
    
    func getWeatherData(url: URL) async throws -> ResponseBody {
        var urlRequest = URLRequest(url: url)
        
        var (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
    
}
