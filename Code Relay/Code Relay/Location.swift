//
//  Data.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//
import CoreLocation

struct Location: Identifiable {
    
    let title: String
    let details: String
    let coordinate: CLLocationCoordinate2D?
    var id: String { title }
}


