//
//  MapView.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var searchText = ""
    
    var body: some View {
        Map(initialPosition: .region(viewModel.region)) {
            
            // UserAnnotation()
            
            // Annotation()
            
            Marker(viewModel.locations[0].name, systemImage: "paperPlane", coordinate: viewModel.locations[0].coordinate)
                .tint(.blue)
        }
        .overlay(alignment: .top) {
            TextField("Search for a location...", text: $searchText)
                .font(.subheadline)
        }
        .onSubmit(of: .text) {
            print("Search for location with query \(searchText)")
        }
        .mapControls {
            MapCompass()
            // MapPitchButton()
            MapUserLocationButton()
        }
    }
}

#Preview {
    MapView()
}
