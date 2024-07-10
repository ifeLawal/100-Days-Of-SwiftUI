//
//  SingleLocationView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/4/24.
//

import SwiftUI

struct SingleLocationWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel = WeatherViewModel()
    var response: ResponseBodyFiveDay?
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
                    switch viewModel.state {
                    case .idle:
                        Text("Attempting to fetch data")
                    case .loading:
                        Text("Loading...")
                    case .success:
                        forecastBody
                            .padding([.leading, .trailing], 10)
                            .padding([.top, .bottom], 10)
                            // End of weekly forecast view
                    case .failure(let error):
                        Text("Error: \(error.localizedDescription)")
                    }

                    Spacer()

                }
                .padding([.leading, .trailing], 20)
                
            }.foregroundStyle(.white)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var forecastBody: some View {
        VStack {
            // Start today time weather
            if let response = response {
                VStack {
                    HStack {
                        Text("Tomorrow")
                            .fontWeight(.heavy)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                        Text(response.list[1].dtTxt.formattedDate() ?? "-")
                    }
                    .padding([.leading, .trailing], 10)
                    .padding([.bottom], 10)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            TimeWeatherTile(
                                temperature: String(Int(response.list[1].main.temp)),
                                weather: response.list[1].weather[0].main,
                                time: response.list[1].dtTxt.formattedTime() ?? "-",
                                backgroundColor: Color.clear
                            )
                            TimeWeatherTile(
                                temperature: String(Int(response.list[2].main.temp)),
                                weather: response.list[2].weather[0].main,
                                time: response.list[2].dtTxt.formattedTime() ?? "-",
                                backgroundColor: Color.clear
                            )
                            TimeWeatherTile(
                                temperature: String(Int(response.list[3].main.temp)),
                                weather: response.list[3].weather[0].main,
                                time: response.list[3].dtTxt.formattedTime() ?? "-",
                                backgroundColor: Color.clear
                            )
                            TimeWeatherTile(
                                addShadow: true,
                                temperature: String(Int(response.list[4].main.temp)),
                                weather: response.list[4].weather[0].main,
                                time: response.list[4].dtTxt.formattedTime() ?? "-"
                            )
                            TimeWeatherTile(
                                temperature: String(Int(response.list[5].main.temp)),
                                weather: response.list[5].weather[0].main,
                                time: response.list[5].dtTxt.formattedTime() ?? "-",
                                backgroundColor: Color.clear
                            )
                            TimeWeatherTile(
                                temperature: String(Int(response.list[6].main.temp)),
                                weather: response.list[6].weather[0].main,
                                time: response.list[6].dtTxt.formattedTime() ?? "-",
                                backgroundColor: Color.clear
                            )
                            TimeWeatherTile(
                                temperature: String(Int(response.list[7].main.temp)),
                                weather: response.list[7].weather[0].main,
                                time: response.list[7].dtTxt.formattedTime() ?? "-",
                                backgroundColor: Color.clear
                            )
                            TimeWeatherTile(
                                temperature: String(Int(response.list[8].main.temp)),
                                weather: response.list[8].weather[0].main,
                                time: response.list[8].dtTxt.formattedTime() ?? "-",
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
                                date: response.list[1].dtTxt.formattedDate() ?? "-",
                                weather: response.list[1].weather[0].main,
                                temperature: String(Int(response.list[1].main.temp))
                            )
                            WeatherDateForecastRow(
                                date: response.list[9].dtTxt.formattedDate() ?? "-",
                                weather: response.list[9].weather[0].main,
                                temperature: String(Int(response.list[9].main.temp))
                            )
                            WeatherDateForecastRow(
                                date: response.list[17].dtTxt.formattedDate() ?? "-",
                                weather: response.list[17].weather[0].main,
                                temperature: String(Int(response.list[17].main.temp))
                            )
                            WeatherDateForecastRow(
                                date: response.list[25].dtTxt.formattedDate() ?? "-",
                                weather: response.list[25].weather[0].main,
                                temperature: String(Int(response.list[25].main.temp))
                            )
                            WeatherDateForecastRow(
                                date: response.list[33].dtTxt.formattedDate() ?? "-",
                                weather: response.list[33].weather[0].main,
                                temperature: String(Int(response.list[33].main.temp))
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SingleLocationWeatherView(response: previewFiveDayWeather)
}
