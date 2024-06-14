//
//  MultipleLocationWeatherView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/15/24.
//

import SwiftUI

struct MultipleLocationWeatherView: View {
    
    @StateObject var weatherViewModel = WeatherViewModel()
    @StateObject var citySearchViewModel = CitySearchViewModel()
    @StateObject var viewModel = WeatherViewModel()
    @State private var showingSearchView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [
                    CustomColors.fullAppTopGradientColor,
                    CustomColors.fullAppBottomGradientColor], startPoint: .top, endPoint: .bottom)
                             .ignoresSafeArea()
                    VStack {
                        VStack {
                            // SearchBar()
                            
                            EnhancedWeatherDetailView(viewModel: weatherViewModel)
                        }
                        .padding([.leading, .trailing], 20)
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                showingSearchView = true
                            }) {
                                SFSymbolsIcon(isOriginalRender: true, iconName: "plus.circle", foregroundColor: Color(hue: 1.0, saturation: 0.0, brightness: 0.888), width: 50, height: 50)
                            }
                            .sheet(isPresented: $showingSearchView) {
                                CitySearchView(viewModel: citySearchViewModel, weatherViewModel: weatherViewModel, isPresented: $showingSearchView)
                            }
                        }
                    }
                }
                .navigationTitle("Weather")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MultipleLocationWeatherView()
}
