//
//  Location.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
