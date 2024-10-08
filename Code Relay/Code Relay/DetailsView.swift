//
//  DetailsView.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

import SwiftUI

struct DetailsView: View {
   
    let location: Location
    
    var body: some View {
        VStack {
            Text(location.title).fontWeight(.bold)
            Text(location.details)
        }
    } 
}
