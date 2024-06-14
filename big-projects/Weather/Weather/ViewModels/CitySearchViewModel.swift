//
//  CitySearchViewModel.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import SwiftUI
import Combine

class CitySearchViewModel: ObservableObject {
    @Published var searchResults: [City] = []

    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()

    func searchCity(query: String) {
        apiService.fetchCities(query: query)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching cities: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] cities in
                self?.searchResults = cities
            })
            .store(in: &cancellables)
    }
}
