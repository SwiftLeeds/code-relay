//
//  ThingToDo.swift
//  Code Relay
//
//  Created by Matt Heaney on 08/10/2024.
//

import SwiftData

@Model
class ThingToDo {
    var locationName: String
    
    init(locationName: String) {
        self.locationName = locationName
    }
}
