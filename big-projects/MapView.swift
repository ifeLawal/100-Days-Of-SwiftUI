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
    
    // State variables to manage the selected location and sheet presentation
    @State private var selectedLocation: Location?
    @State private var isSheetPresented = false
    
    // https://www.youtube.com/watch?v=9xzHJAT_Iqk&list=PLBn01m5Vbs4A0dus7gfymgj0UI1qKTe3M
    var body: some View {
        Map(initialPosition: .region(viewModel.region)) {
            
            // UserAnnotation()
            
            // Annotation()
            ForEach(viewModel.locations) { location in
                Group {
                    Marker(location.name, systemImage: "film", coordinate: location.coordinate)
                        .tint(.blue)
                }
                .tag(location)
//                AnyMapAnnotationProtocol(MapAnnotation(coordinate: location.coordinate) {
//                    HStack {
//                        Image(systemName: "mappin")
//                            .resizable()
//                            .frame(width: 45, height: 40)
//                            .clipShape(Capsule())
//                        Text("This annotation can be tapped.")
//                            .foregroundColor(.black)
//                    }
//                    .onTapGesture {
//                        print("Test tapping")
//                    }
//                })
            }
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
