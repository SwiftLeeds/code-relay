//
//  ContentView.swift
//  Code Relay
//
//  Created by Adam Rush on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("Favourites", systemImage: "star") {
                // TODO: Add Favourites View 🍤
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }.tint(.red)
    }
}

#Preview {
    ContentView()
}
