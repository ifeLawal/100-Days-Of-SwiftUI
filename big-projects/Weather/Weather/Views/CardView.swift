//
//  CardView.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 4/6/24.
//

import SwiftUI

struct CardView: View {
    var foregroundColor: Color
    var backgroundColor: Color
    var padding: Double = 20
    @State var weatherData: ResponseBody = previewCityWeather
        
    var body: some View {
        VStack(alignment: .leading)  {
            HStack {
                VStack(alignment: .leading) {
                    Text(weatherData.name + ",")
                        .fontWeight(.heavy)
                    Text(weatherData.sys.country)
                }
                Spacer()
                SFSymbolsIcon(isOriginalRender: true, iconName: getIcon(weather: weatherData.weather[0].main), foregroundColor: foregroundColor, width: 40, height: 40, paddingVertical: 0)
            }
            
            WeatherRow(description: weatherData.weather[0].description,
                       humidity: weatherData.main.humidity,
                       windSpeed: weatherData.wind.speed,
                       temperature: weatherData.main.temp
            )
        }
        .padding(padding)
        .frame(maxWidth: .infinity, alignment: .leading)
//        .foregroundColor(foregroundColor)
//        .background(backgroundColor)
//        .cornerRadius(25)
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    CardView(foregroundColor: .blue, backgroundColor: Color(hue: 1.0, saturation: 0.0, brightness: 0.888, opacity: 0.5))
}
