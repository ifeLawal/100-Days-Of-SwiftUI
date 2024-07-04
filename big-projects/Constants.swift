//
//  CoreLocation.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import CoreLocation

struct Constants {
    static let newYorkCity = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
    static let initialLocations = [
        Location(name: "Statue of Liberty", coordinate: CLLocationCoordinate2D(latitude: 40.6892, longitude: -74.0445)),
        Location(name: "Central Park", coordinate: CLLocationCoordinate2D(latitude: 40.7851, longitude: -73.9683)),
        Location(name: "Coney Island", coordinate: CLLocationCoordinate2D(latitude: 40.5755, longitude: -73.9829))
    ]
}
