//
//  LumiereTrailApp.swift
//  LumiereTrail
//
//  Created by Ifeoluwa Lawal on 7/2/24.
//

import SwiftUI
import SwiftData

@main
struct LumiereTrailApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .modelContainer(ModelContainerProvider.shared)
        }
    }
}
