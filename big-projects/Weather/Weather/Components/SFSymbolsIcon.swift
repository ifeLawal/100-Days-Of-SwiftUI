//
//  IconButton.swift
//  Weather
//
//  Created by Ifeoluwa Lawal on 4/29/24.
//
//  Supported by SF Symbols
//
//  SF Symbols color
//  https://sarunw.com/posts/how-to-change-color-of-sf-symbols/

import Foundation
import SwiftUI

struct SFSymbolsIcon: View {
    var isOriginalRender: Bool = false
    var iconName: String
    var foregroundColor: Color = .white
    var width: CGFloat = 20
    var height: CGFloat = 20
    var paddingHorizontal: CGFloat = 20
    var paddingVertical: CGFloat = 20
    
    var body: some View {
        Image(systemName: iconName)
            .renderingMode(isOriginalRender ? .original: .template)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .foregroundColor(foregroundColor)
            .padding([.leading, .trailing], paddingHorizontal)
            .padding([.top, .bottom], paddingVertical)
    }
}


#Preview {
    SFSymbolsIcon(iconName: "plus.circle", foregroundColor: Color(hue: 1.0, saturation: 0.0, brightness: 0.888), width: 75, height: 75)
}
