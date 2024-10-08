//
//  HomeView.swift
//  Code Relay
//
//  Created by Mikaela Caron on 10/8/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var thingsToDo = [
        "Leeds Playhouse",
        "Leeds Art Gallery",
        "Victoria Leeds",
        "Royal Armouries",
        "Brew Society",
        "Brew Dog"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(thingsToDo, id: \.self) { stuff in
                    Text(stuff)
                }
            }
            .navigationTitle("Guide to Leeds")
        }
    }
}

#Preview {
    HomeView()
}
