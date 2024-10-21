//
//  HomeViewModel.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

import CoreLocation

final class HomeViewModel: ObservableObject {
    
    init() {
        locationsData = [
            Location(
                title: "Leeds Playhouse",
                details: "Good Conference",
                coordinate: CLLocationCoordinate2D(latitude: 53.797932, longitude: -1.534352),
                phoneNumber: "0044 113 213 7700"
            ),
            Location(
                title: "Leeds Art Gallery",
                details: "Good Art",
                coordinate: CLLocationCoordinate2D(latitude: 53.799992, longitude: -1.548128),
                phoneNumber: "0044 113 378 5350"
            ),
            Location(
                title: "Victoria Leeds",
                details: "Something good",
                coordinate: CLLocationCoordinate2D(latitude: 53.798014, longitude: -1.539134),
                phoneNumber: "0044 113 245 5333"
            ),
            Location(
                title: "Royal Armouries",
                details: "Good Armor",
                coordinate: CLLocationCoordinate2D(latitude: 53.791750, longitude: -1.532436),
                phoneNumber: "0044 113 220 1916"
            ),
            Location(title: "Brew Society", 
                     details: "Good Beer", 
                     coordinate: CLLocationCoordinate2D(latitude: 53.795610, longitude: -1.550365), 
                     phoneNumber: nil),
            Location(
                title: "Brew Dog",
                details: "Good Dog Beer",
                coordinate: CLLocationCoordinate2D(latitude: 53.801097, longitude: -1.538588),
                phoneNumber: "0044 113 391 2950"
            ),
            Location(title: "NQ64 Arcade Bar", details: "Retro Gaming Bar", coordinate: nil, phoneNumber: "0044 113 245 5333"),
            Location(title: "K-Cube", details: "Karaoke all night long", coordinate: nil, phoneNumber: "0044 113 322 6625"),
        ]
    }
    
    @Published var locationsData: [Location] 
}
