//
//  SitesToSeeApp.swift
//  SitesToSee
//
//  Created by Ifeoluwa Lawal on 8/21/24.
//

import SwiftUI
import SwiftData

@main
struct SitesToSeeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
