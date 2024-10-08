//
//  HomeView.swift
//  Code Relay
//
//  Created by Mikaela Caron, Matt Heaney (Add your name here!) on 10/8/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var thingsToDo: [ThingToDo] = []
    
    @State private var showNewLocationPrompt = false
    @State private var newLocationName: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(thingsToDo, id: \.self) { stuff in
                    Text(stuff.locationName)
                }
            }
            .navigationTitle("Guide to Leeds")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { 
                        self.showNewLocationPrompt = true
                    } label: { 
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Enter your name", isPresented: $showNewLocationPrompt) {
                TextField("Enter new location", text: $newLocationName)
                
                Button { 
                    addNewLocation()
                } label: { 
                    Text("Add")
                }
                
            } message: {
                Text("Add a new awesome location in Leeds!")
            }
        }
    }
    
    func addNewLocation() {
        modelContext.insert(ThingToDo(locationName: newLocationName))
        self.newLocationName = ""
        self.showNewLocationPrompt = false
    }
}

#Preview {
    HomeView()
}

