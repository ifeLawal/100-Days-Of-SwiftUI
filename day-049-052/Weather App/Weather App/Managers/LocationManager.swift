//
//  LocationManager.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/16/24.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    @Published var isLoading = false
    
    override init() {
        super.init()
                
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = kCLDistanceFilterNone
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let CLLocation = locations.first else {
            isLoading = false
            return
        }
        
        location = CLLocation.coordinate
        
        region = MKCoordinateRegion(center: location!, latitudinalMeters: 5000, longitudinalMeters: 5000)
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting the location", error)
        isLoading = false
    }
}
