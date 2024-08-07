//
//  WeatherModelData.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/18/24.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData")
var previewCityWeather: ResponseBody = load("weatherData_2_5_City")
var previewFiveDayWeather: ResponseBodyFiveDay = load("weatherData_2-5_5_Day")
var previewCityList: [String] = load("cities_array")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
