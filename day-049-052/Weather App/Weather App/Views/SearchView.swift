//
//  SearchView.swift
//  Weather App
//
//  Created by Ifeoluwa Lawal on 3/31/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var locationManager = LocationManager()
    @State var searchWord: String = ""
    @StateObject var vm = SearchResultsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List(vm.places) { place in
                    Text(place.name)
                }
                
            }
            .searchable(text: $searchWord)
            .onChange(of: searchWord, initial: false) { _, newSearchWord in
                vm.places = []
                if !newSearchWord.isEmpty {
                    vm.search(text: newSearchWord, region: locationManager.region)
                }
                
            }
            .navigationTitle("Places")
        }
    }
}

#Preview {
    SearchView()
}
