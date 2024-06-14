//
//  WeatherData.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/14/24.
//

import Foundation

struct WeatherData: Identifiable {
    let id = UUID()
    let city: String
    let temperature: Double
    let condition: String
}

struct OpenWeatherData: Codable {
    var city: String
    var temperature: Double
    var condition: String
    var feelsLike: Double
    var minTemperature: Double
    var maxTemperature: Double
    var pressure: Int
    var humidity: Int
    var windSpeed: Double
    var windDirection: Int
    var sunrise: Date
    var sunset: Date
    var dailyForecast: [DailyForecast]?
}

struct DailyForecast: Codable, Identifiable {
    let id = UUID()
    var date: Date
    var temperature: Double
    var minTemperature: Double
    var maxTemperature: Double
    var condition: String
}
