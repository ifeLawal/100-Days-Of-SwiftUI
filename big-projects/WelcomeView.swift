//
//  WelcomeView.swift
//  LumièreTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to \n LumièreTrail")
                    .font(.largeTitle)
                    .padding()
                
//                NavigationLink(
//                    destination: MapView(listMapLocations: Constants.initialMapLocations)) {
//                        CustomButton(title: "Map View")
//                    }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
