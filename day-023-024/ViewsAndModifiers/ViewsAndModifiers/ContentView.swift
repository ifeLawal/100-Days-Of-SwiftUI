//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ifeoluwa Lawal on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body)) // self.body provides the underlying type which includes the modifiers
        }
        .frame(width: 200, height: 200)
        .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
