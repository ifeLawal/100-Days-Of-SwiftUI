//
//  CurrentLocationView.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/18/24.
//

import SwiftUI

struct CurrentLocationView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                let longitude = location.longitude
                let latitude = location.latitude
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(longitude: longitude, latitude: latitude);
                            } catch {
                                print("Error getting wearther: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.671, saturation: 0.818, brightness: 0.478))
        .preferredColorScheme(.dark)
        .padding()
    }
}

#Preview {
    CurrentLocationView()
}
