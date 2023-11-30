//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Tim Mitra on 2023-11-30.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
