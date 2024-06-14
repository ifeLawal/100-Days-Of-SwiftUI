//
//  SheetView.swift
//  NavigationStack
//
//  Created by Ifeoluwa Lawal on 4/6/24.
//

import SwiftUI


struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Second View")
        Text("Hello, \(name)")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}
/*
 https://www.behance.net/gallery/192899875/Weather-App?tracking_source=search_projects|ios+weather+app&l=54
 https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views
 */

struct SheetView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // show the sheet
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "Steve")
        })
    }
}

#Preview {
    SheetView()
}
