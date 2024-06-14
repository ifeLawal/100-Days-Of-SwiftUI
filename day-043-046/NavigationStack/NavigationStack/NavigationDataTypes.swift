//
//  NavigationDataTypes.swift
//  NavigationStack
//
//  Created by Ifeoluwa Lawal on 3/31/24.
//

import SwiftUI

/*
 
 https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink
 https://www.hackingwithswift.com/100/swiftui/43
 */

struct DetailedView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail \(number)")
    }
}

struct NavigationDataTypes: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                Text("Tap Me")
                    .navigationTitle("SwiftUI")
            }
        }
        
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailedView(number: 55)
            }
        }
        
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
            }
        }
        
        NavigationStack {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select a number \(i)", value: i)
                }
                
            }
        }
    }
}

#Preview {
    NavigationDataTypes()
}
