//
//  WeatherDateForecastRow.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/4/24.
//

import SwiftUI

struct WeatherDateForecastRow: View {
    var date: String = "Mar, 13"
    var weather: String = "sun"
    var temperature: String = "14"
    var unit: String = "°F"
    var fontSize: CGFloat = 20
    var width: CGFloat = 40
    var height: CGFloat = 40
    
    var body: some View {
        VStack {
            HStack {
                Text(date)
                    .font(.system(size: fontSize))
                Spacer()
                SFSymbolsIcon(isOriginalRender: true, iconName: getIcon(weather: weather), foregroundColor: .black, width: width, height: height)
                Spacer()
                Text(temperature + unit)
                    .font(.system(size: fontSize))
            }
        }
    }
}

#Preview {
    WeatherDateForecastRow()
}
