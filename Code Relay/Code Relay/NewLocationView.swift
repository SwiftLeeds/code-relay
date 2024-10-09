//
//  NewLocationView.swift
//  Code Relay
//
//  Created by Petter vang Brakalsvålet on 09/10/2024.
//

import SwiftUI
import CoreLocation
import MapKit

public struct NewLocationView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState var field: FocusField?
    
    @State var title: String
    @State var details: String
    @State var lat: Double?
    @State var long: Double?
    @State var phoneNumber: String
    
    // Init the location with the current coordinates if applicable
    @State var location: Location
    
    public var body: some View {
        
        var region: Binding<MKCoordinateRegion> = Binding {
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        } set: {_ in }
        
        
        NavigationStack {
            VStack {
                List {
                    TextField("Title", text: $title)
                        .id(FocusField.title)
                        .focused($field, equals: .title)
                    TextField("Details", text: $details)
                        .id(FocusField.details)
                        .focused($field, equals: .details)
                    TextField("Coordinate lat", value: $lat, format: .number)
                        .id(FocusField.lat)
                        .focused($field, equals: .lat)
                    TextField("Coordinate long", value: $long, format: .number)
                        .id(FocusField.long)
                        .focused($field, equals: .long)
                    TextField("Phone number", text: $phoneNumber)
                        .id(FocusField.phoneNumber)
                        .focused($field, equals: .phoneNumber)
                }
                .onSubmit {
                    field = field?.next
                }
                
                Spacer()
                Map {
                    Marker("Selected Coordinate", coordinate: CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0))
                }
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 12)
                .frame(height: 250)
                .frame(maxWidth: .infinity)     
                Spacer()
                
                Button { 
                    let coordinate: CLLocationCoordinate2D? = if let lat, let long {
                        .init(latitude: lat, longitude: long)
                    } else { 
                        nil
                    }
                    guard !title.isEmpty, !details.isEmpty else { return }
                    NotificationCenter.default.post(
                        name: .newLocation,
                        object: self,
                        userInfo: ["location": Location(
                            title: title,
                            details: details,
                            coordinate: coordinate,
                            phoneNumber: phoneNumber
                        )]
                    )
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
                .font(.title2)
                .bold()
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 24)
            }
            .navigationTitle("Add New Location")
        }.onChange(of: lat ?? 0) { oldValue, newValue in
            region.wrappedValue = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
        .onChange(of: long ?? 0) { oldValue, newValue in
            region.wrappedValue = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
    
    init(
        title: String,
        details: String,
        lat: Double? = nil,
        long: Double? = nil,
        phoneNumber: String
    ) {
        self.title = title
        self.details = details
        self.lat = lat
        self.long = long
        self.phoneNumber = phoneNumber
        self.location = Location(title: "", details: "", coordinate: CLLocationCoordinate2D(latitude: lat ?? 0, longitude: long ?? 0), phoneNumber: "")
    }
}

#Preview {
    NewLocationView(title: "", details: "", lat: nil, long: nil, phoneNumber: "")
}
