//
//  ViewModel.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

import CoreLocation

final class ViewModel: ObservableObject {
    
    init() {
        locationsData = [
            Location(
                title: "Leeds Playhouse",
                details: "Good Conference",
                coordinate: CLLocationCoordinate2D(latitude: 53.7981911, longitude: -1.5376449),
                phoneNumber: "0044 113 213 7700"
            ),
            Location(
                title: "Leeds Art Gallery",
                details: "Good Art",
                coordinate: CLLocationCoordinate2D(latitude: 53.7999507, longitude: -1.5508274),
                phoneNumber: "0044 113 378 5350"
            ),
            Location(
                title: "Victoria Leeds",
                details: "Something good",
                coordinate: CLLocationCoordinate2D(latitude: 53.798151, longitude: -1.5417475),
                phoneNumber: "0044 113 245 5333"
            ),
            Location(
                title: "Royal Armouries",
                details: "Good Armor",
                coordinate: CLLocationCoordinate2D(latitude: 53.7917894, longitude: -1.5348083),
                phoneNumber: "0044 113 220 1916"
            ),
            Location(title: "Brew Society", 
                     details: "Good Beer", 
                     coordinate: CLLocationCoordinate2D(latitude: 53.7956807, longitude: -1.5528864), 
                     phoneNumber: nil),
            Location(
                title: "Brew Dog",
                details: "Good Dog Beer",
                coordinate: CLLocationCoordinate2D(latitude: 53.8010952, longitude: -1.5413394),
                phoneNumber: "0044 113 391 2950"
            ),
            Location(title: "K-Cube", details: "Karaoke all night long", coordinate: nil, phoneNumber: "0044 113 322 6625"),
        ]
    }
    
    @Published var locationsData: [Location] 
}
