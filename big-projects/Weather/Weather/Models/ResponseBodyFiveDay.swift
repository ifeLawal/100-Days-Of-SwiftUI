//
//  ResponseBodyFiveDay.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 7/6/24.
//

import Foundation

// Model of the response body we get from calling the OpenWeather API
struct ResponseBodyFiveDay: Decodable {
    var list: [WeatherForecast]
    var city: CityResponse
    
    struct CityResponse: Decodable {
        var name: String
        var coord: CoordinatesResponse
        var country: String
    }
    
    struct WeatherForecast: Decodable {
        var weather: [WeatherResponse]
        var main: MainResponse
        var wind: WindResponse
        var dt_txt: String
    }

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
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
    
    struct SystemResponse: Decodable {
        var type: Int
        var id: Int
        var country: String
        var sunrise: Int
        var sunset: Int
    }
}

extension ResponseBodyFiveDay.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

extension ResponseBodyFiveDay.WeatherForecast {
    var dtTxt: String { return dt_txt }
}
