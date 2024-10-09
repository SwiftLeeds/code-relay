//
//  ViewModel.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

import CoreLocation

struct ViewModel {
    
    init() {
        locationsData = [
            Location(title: "Leeds Playhouse", details: "Good Conference", coordinate: nil, phoneNumber: "0044 113 213 7700"),
            Location(title: "Leeds Art Gallery", details: "Good Art", coordinate: nil, phoneNumber: "0044 113 378 5350"),
            Location(title: "Victoria Leeds", details: "Something good", coordinate: nil, phoneNumber: "0044 113 245 5333"),
            Location(title: "Royal Armouries", details: "Good Armor", coordinate: nil, phoneNumber: "0044 113 220 1916"),
            Location(title: "Brew Society", details: "Good Beer", coordinate: nil, phoneNumber: nil),
            Location(title: "Brew Dog", details: "Good Dog Beer", coordinate: nil, phoneNumber: "0044 113 391 2950"),
            Location(title: "NQ64 Arcade Bar", details: "Retro Gaming Bar", coordinate: nil, phoneNumber: "0044 113 245 5333"),
        ]
    }
    
    let locationsData: [Location] 
}
