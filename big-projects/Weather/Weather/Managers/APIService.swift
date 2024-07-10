//
//  APIService.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import Foundation
import Combine
import SwiftUI

class APIService {
    func fetchCities(query: String) -> AnyPublisher<[City], Error> {
        // Simulate a network request with a delay
        let cityList = previewCityList
        var cities: [City] = []
        
        for cityName in cityList {
            let city: City = City(name: cityName)
            cities.append(city)
        }
        
        let filteredCities = cities.filter { $0.name.lowercased().contains(query.lowercased()) }
        
        return Just(filteredCities)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
