//
//  ViewModel.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

struct ViewModel {
    
    init() {
        locationsData = [
            Location(title: "Leeds Playhouse", details: "Good Conference", coordinate: nil),
            Location(title: "Leeds Art Gallery", details: "Good Art", coordinate: nil),
            Location(title: "Victoria Leeds", details: "Something good", coordinate: nil),
            Location(title: "Royal Armouries", details: "Good Armor", coordinate: nil),
            Location(title: "Brew Society", details: "Good Beer", coordinate: nil),
            Location(title: "Brew Dog", details: "Good Dog Beer", coordinate: nil),
        ]
    }
    
    let locationsData: [Location] 
}
