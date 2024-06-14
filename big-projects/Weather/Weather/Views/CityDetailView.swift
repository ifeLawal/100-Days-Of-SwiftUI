//
//  CityDetailView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import SwiftUI

struct CityDetailView: View {
    let city: String

    var body: some View {
        VStack {
            Text("Weather Details for \(city)")
                .font(.largeTitle)
                .padding()

            // Add more detailed weather information here
        }
        .navigationTitle(city)
    }
}

#Preview {
    CityDetailView(city: "New York City")
}
