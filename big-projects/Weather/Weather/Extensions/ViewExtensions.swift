//
//  ViewExtensions.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 4/6/24.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

enum Weather: String {
    case sun, rain, boltRain, wind, snow, cloud, cloudSun, cloudMoon
}

func getIcon(weather: String) -> String {
    switch weather {
    case Weather.sun.rawValue:
        "sun.max.fill"
    case Weather.rain.rawValue:
        "cloud.rain.fill"
    case Weather.boltRain.rawValue:
        "cloud.bolt.rain.fill"
    case Weather.cloud.rawValue:
        "cloud.fill"
    case Weather.cloudSun.rawValue:
        "cloud.sun.fill"
    case Weather.cloudMoon.rawValue:
        "cloud.moon.fill"
    case Weather.snow.rawValue:
        "cloud.snow"
    case Weather.wind.rawValue:
        "wind"
    default:
        "questionmark"
    
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//extension MKCoordinateRegion {
//    
//    static func defaultRegion() -> MKCoordinateRegion {
//        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 29.726819, longitude: -95.393692), latitudinalMeters: 100, longitudinalMeters: 100)
//    }
//}
