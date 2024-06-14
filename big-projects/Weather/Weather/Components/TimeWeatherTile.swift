//
//  TimeWeatherTile.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 5/4/24.
//

import SwiftUI

struct TimeWeatherTile: View {
    @State var addShadow: Bool = false
    var temperature: String = "14"
    var unit: String = "°C"
    var weather: String = "cloudSun"
    var time: String = "17:00"
    var foregroundColor: Color = .white
    var altBackgroundColor: Color = Color(hue: 0.528, saturation: 0.468, brightness: 0.679, opacity: 1)
    var backgroundColor: Color = Color(red: 0.221, green: 0.422, blue: 0.526)
    // 586D7D
    // 0.346 0.426 0.49
    // 0.346 0.422 0.486
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(temperature + unit)
            SFSymbolsIcon(isOriginalRender: true, iconName: getIcon(weather: weather), foregroundColor: foregroundColor, width: 30, paddingVertical: 0)
            Text(time)
            
        }
        .padding([.top, .bottom], 15)
        .padding([.trailing, .leading], 5)
        .foregroundColor(foregroundColor)
        .background(
            Group {
                if addShadow {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(altBackgroundColor) // Replace Color.blue with your desired background color
                        .shadow(color: Color.black.opacity(0.5), radius: 0, x: 5, y: 5) // Add drop shadow
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(backgroundColor)
                }
            }
        )
    }
    
    
    /*
     
     
     */
}

#Preview {
    TimeWeatherTile()
}
