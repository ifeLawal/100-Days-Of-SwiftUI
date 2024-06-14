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
    @State var weatherData: WeatherData = WeatherData(city: "New York", temperature: 70, condition: "sun")
    
    var city: String = "Vermont"
    var country: String = "USA"
    
    var percipitation: Double = 0
    var humidity: Double = 58
    var windSpeed: Double = 6
    var weather: String = "sun"
    
    var temperature: Double = 9
        
    var body: some View {
        VStack(alignment: .leading)  {
            HStack {
                VStack(alignment: .leading) {
                    Text(weatherData.city + ",")
                        .fontWeight(.heavy)
                    Text(country)
                }
                Spacer()
                SFSymbolsIcon(isOriginalRender: true, iconName: getIcon(weather: weatherData.condition), foregroundColor: foregroundColor, width: 40, height: 40, paddingVertical: 0)
            }
            
            WeatherRow(percipitation: percipitation,
                       humidity: humidity,
                       windSpeed: windSpeed,
                       temperature: weatherData.temperature
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
