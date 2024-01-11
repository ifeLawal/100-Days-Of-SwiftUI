//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ifeoluwa Lawal on 1/5/24.
//

import SwiftUI

struct prominentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominent() -> some View {
        modifier(prominentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Stand out")
                .prominent()
            Button("Hello, world!") {
                print(type(of: self.body)) // self.body provides the underlying type which includes the modifiers
            }
            .frame(width: 200, height: 200)
            .background(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
