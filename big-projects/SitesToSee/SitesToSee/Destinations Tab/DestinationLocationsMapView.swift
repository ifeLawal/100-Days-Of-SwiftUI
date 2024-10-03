//
//  DestinationLocationsMapView.swift
//  SitesToSee
//
//  Created by Ifeoluwa Lawal on 8/30/24.
//

import SwiftUI
import MapKit

struct DestinationLocationsMapView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    
    var body: some View {
        Map(position: $cameraPosition) {
            // 51.505507, -0.075402
            Marker(
                "Tower Bridge",
                coordinate: .towerBridge
            )
            Marker(coordinate: .bigBen) {
                Label("Big Ben", systemImage: "star.fill")
            }
            .tint(.yellow)
            Marker("Sky Garden", image: "eiffelTower", coordinate: .skyGarden)
            Marker("Uber Boat", monogram: Text("UB"), coordinate: .uberBoat)
                .tint(.accent)
            Marker("Eye of London", systemImage: "circle", coordinate: .eyeOfLondon)
                .tint(.appBlue)
            Annotation("Harry Potter", coordinate: .harryPotterTrain) {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundColor(.red)
                    .padding(10)
                    .background(.white)
                    .clipShape(.circle)
            }
            Annotation("Buckingham Palace", coordinate: .buckinghamPalace, anchor: .center) {
                Image(.sacreCoeur)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            Annotation("Borough Market", coordinate: .boroughMarket) {
                Image(systemName: "mappin")
                    .imageScale(.large)
                    .foregroundColor(.red)
                    .padding(5)
                    .overlay {
                        Circle()
                            .strokeBorder(.red, lineWidth: 2)
                    }
            }
            /*
            MapCircle(
                center: CLLocationCoordinate2D(latitude: 51.500685, longitude: -0.083543),
                radius: 5000
            )
            .foregroundStyle(.red.opacity(0.5))
             */
        }
        // useful for search
        .onMapCameraChange(frequency: .onEnd) { context in
            visibleRegion = context.region
        }
            .onAppear {
                // 51.503347, -0.079396
                let london = CLLocationCoordinate2D(latitude: 51.503347, longitude: -0.079396)
                let londonSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                let londonRegion = MKCoordinateRegion(center: london, span: londonSpan)
                cameraPosition = .region(londonRegion)
            }
        
    }
}

#Preview {
    DestinationLocationsMapView()
}
