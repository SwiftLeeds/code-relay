//
//  DetailsView.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

import SwiftUI
import MapKit

struct DetailsView: View {
   
    //To do - link this up to actual coordinates!
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), 
                                                   span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    @State var location: Location
    
    var body: some View {
        VStack {
            Map(initialPosition: .region(region))
                .frame(height: 400)
                .frame(maxWidth: .infinity)               
            
            Text(location.title).fontWeight(.bold)
            Text(location.details)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    } 
}
