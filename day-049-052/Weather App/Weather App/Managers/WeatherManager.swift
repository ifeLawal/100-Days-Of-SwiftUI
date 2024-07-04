//
//  WeatherManager.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/18/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    var baseUrl3 = "https://api.openweathermap.org/data/3.0/onecall"
    var baseUrl2 = "https://api.openweathermap.org/data/2.5/weather"
    var appId = "blah"
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

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
