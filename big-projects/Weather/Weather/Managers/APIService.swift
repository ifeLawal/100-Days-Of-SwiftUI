//
//  APIService.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import Foundation
import Combine

class APIService {
    func fetchCities(query: String) -> AnyPublisher<[City], Error> {
        // Simulate a network request with a delay
        let cities = [
            City(name: "New York"),
            City(name: "Los Angeles"),
            City(name: "Chicago"),
            City(name: "Houston"),
            City(name: "Phoenix"),
            City(name: "London"),
            City(name: "Paris"),
            City(name: "Berlin"),
            City(name: "Tokyo"),
            City(name: "Beijing")
        ]
        
        let filteredCities = cities.filter { $0.name.lowercased().contains(query.lowercased()) }
        
        return Just(filteredCities)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
