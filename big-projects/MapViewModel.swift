//
//  MapViewModels.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(
        center: Constants.newYorkCity,
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Published var locations = Constants.initialLocations
}
