//
//  ContentView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 4/6/24.
//
// https://www.behance.net/gallery/192899875/Weather-App/modules/1091239019
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance()
            .layoutMargins.left = 20
    }
        
    var body: some View {
        MultipleLocationWeatherView()
    }
}

#Preview {
    ContentView()
}
