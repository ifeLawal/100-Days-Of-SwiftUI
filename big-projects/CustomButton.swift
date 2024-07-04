//
//  CustomButton.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    CustomButton(title: "Button")
}
