//
//  ContentView.swift
//  NavigationStack
//
//  Created by Ifeoluwa Lawal on 3/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }.navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
        
        Button("Show Navigation") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            NavigationDataTypes()
        })
        
    }
}

#Preview {
    ContentView()
}
