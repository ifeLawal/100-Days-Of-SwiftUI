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
    case clear, rain, drizzle, thunderstorm, wind, snow, cloud, clouds, cloudSun, cloudMoon,
         haze, mist, smoke, dust, fog, ash, squall, tornado
}

func getIcon(weather: String) -> String {
    switch weather.lowercased() {
    case Weather.clear.rawValue:
        "sun.max.fill"
    case Weather.rain.rawValue:
        "cloud.rain.fill"
    case Weather.drizzle.rawValue:
        "cloud.heavyrain"
    case Weather.thunderstorm.rawValue:
        "cloud.bolt.rain.fill"
    case Weather.cloud.rawValue:
        "cloud.fill"
    case Weather.clouds.rawValue:
        "cloud.fill"
    case Weather.cloudSun.rawValue:
        "cloud.sun.fill"
    case Weather.cloudMoon.rawValue:
        "cloud.moon.fill"
    case Weather.snow.rawValue:
        "cloud.snow"
    case Weather.wind.rawValue:
        "wind"
    case Weather.haze.rawValue:
        "sun.haze"
    case Weather.mist.rawValue:
        "sun.haze"
    case Weather.smoke.rawValue:
        "smoke"
    case Weather.dust.rawValue:
        "sun.dust"
    case Weather.fog.rawValue:
        "cloud.fog"
    case Weather.ash.rawValue:
        "sun.haze"
    case Weather.squall.rawValue:
        "sun.haze"
    case Weather.tornado.rawValue:
        "tornado"
    default:
        "questionmark"
    
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func runAsyncTask(_ action: @escaping () async throws -> Void, onError: @escaping (Error) -> Void = { _ in }) -> some View {
        self.onAppear {
            Task {
                do {
                    try await action()
                } catch {
                    onError(error)
                }
            }
        }
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
