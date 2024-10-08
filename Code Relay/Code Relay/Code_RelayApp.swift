//
//  Code_RelayApp.swift
//  Code Relay
//
//  Created by Adam Rush on 17/09/2024.
//

import SwiftUI
import SwiftData

@main
struct Code_RelayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ThingToDo.self])
        }
    }
}
