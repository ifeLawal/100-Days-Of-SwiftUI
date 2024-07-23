//
//  ManagerExtensions.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 7/23/24.
//

import Foundation
import CoreLocation

protocol WeatherManagerProtocol {
    func getCurrentWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBody
    func getFiveDayWeatherForecast(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> ResponseBodyFiveDay
    func getCurrentWeather(city: String) async throws -> ResponseBody
    // func fetchData<T: Decodable>(from url: URL, type: T.Type) async throws -> T
}
