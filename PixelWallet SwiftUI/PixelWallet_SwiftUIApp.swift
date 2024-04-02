//
//  PixelWallet_SwiftUIApp.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI
import SwiftData

@main
struct PixelWallet_SwiftUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
