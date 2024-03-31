//
//  SearchResultsViewModel.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/21/24.
//

import Foundation
import MapKit

// @MainActor
class SearchResultsViewModel: ObservableObject {
    
    @Published var places = [PlaceViewModal]()
    
    func search(text: String, region: MKCoordinateRegion) {
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.places = response.mapItems.map(PlaceViewModal.init)
        }
    }
}

struct PlaceViewModal: Identifiable {
    
    let id = UUID()
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        mapItem.name ?? ""
    }
}
