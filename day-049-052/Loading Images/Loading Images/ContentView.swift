//
//  ContentView.swift
//  Loading Images
//
//  Created by Ifeoluwa Lawal on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
            .frame(width: 200, height: 200)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
