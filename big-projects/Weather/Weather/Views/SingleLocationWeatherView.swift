//
//  SingleLocationView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/4/24.
//

import SwiftUI

struct SingleLocationWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel = WeatherViewModel()
    var city: String = "New York"
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [
                    CustomColors.fullAppTopGradientColor,
                    CustomColors.fullAppBottomGradientColor], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    // Start locaton
                    HStack {
                        SFSymbolsIcon(iconName: "mappin.and.ellipse", foregroundColor: .white, width: 25, height: 25, paddingHorizontal: 0)
                        Text(city)
                            .fontWeight(.heavy)
                            .font(.largeTitle)         
                    }
                    .padding([.bottom], 10)
                    
                    // End locaton
                    
                    // Start today time weather
                    VStack {
                        HStack {
                            Text("Today")
                                .fontWeight(.heavy)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            Text("Mar. 12")
                        }
                        .padding([.leading, .trailing], 10)
                        .padding([.bottom], 10)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                /*
                                 var temperature: String = "14"
                                 var unit: String = "°C"
                                 var weather: String = "cloudSun"
                                 var time: String = "17:00"
                                 */
                                
                                TimeWeatherTile(
                                    temperature: "20",
                                    weather: "cloudSun",
                                    time: "15:00",
                                    backgroundColor: Color.clear
                                )
                                TimeWeatherTile(
                                    temperature: "18",
                                    weather: "cloudSun",
                                    time: "16:00",
                                    backgroundColor: Color.clear
                                )
                                TimeWeatherTile(
                                    addShadow: true,
                                    temperature: "14",
                                    weather: "cloud",
                                    time: "17:00"
                                )
                                TimeWeatherTile(
                                    temperature: "11",
                                    weather: "cloudMoon",
                                    time: "18:00",
                                    backgroundColor: Color.clear
                                )
                                TimeWeatherTile(
                                    temperature: "12",
                                    weather: "cloudMoon",
                                    time: "18:00",
                                    backgroundColor: Color.clear
                                )
                            }
                        }
                    }
                    .padding([.bottom])
                    // End today time weather
                
                    // Start weekly forecast
                    VStack {
                        HStack {
                            Text("Upcoming Days")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            SFSymbolsIcon(iconName: "calendar")
                        }
                        ScrollView(.vertical) {
                            VStack {
                                /*
                                 var date: String = "Mar, 13"
                                 var weather: String = "sun"
                                 var temperature: String = "14"
                                 var unit: String = "°C"
                                 */
                                WeatherDateForecastRow(
                                    date: "Mar, 13",
                                    weather: "boltRain",
                                    temperature: "20"
                                )
                                WeatherDateForecastRow(
                                    date: "Mar, 14",
                                    weather: "rain",
                                    temperature: "22"
                                )
                                WeatherDateForecastRow(
                                    date: "Mar, 15",
                                    weather: "sun",
                                    temperature: "34"
                                )
                                WeatherDateForecastRow(
                                    date: "Mar, 16",
                                    weather: "cloud",
                                    temperature: "27"
                                )
                                WeatherDateForecastRow(
                                    date: "Mar, 17",
                                    weather: "cloudSun",
                                    temperature: "32"
                                )
                            }
                        }
                    }
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 10)
                    // End weekly forecast
                    Spacer()
                }
                .padding([.leading, .trailing], 20)
            }.foregroundStyle(.white)
        }
    }
}

#Preview {
    SingleLocationWeatherView()
}
