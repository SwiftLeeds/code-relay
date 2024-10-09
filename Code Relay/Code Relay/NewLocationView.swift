//
//  NewLocationView.swift
//  Code Relay
//
//  Created by Petter vang Brakalsvålet on 09/10/2024.
//

import SwiftUI
import CoreLocation

public struct NewLocationView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState var field: FocusField?
    
    @State var title: String
    @State var details: String
    @State var lat: Double?
    @State var long: Double?
    @State var phoneNumber: String
    
    public var body: some View {
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
        }
    }
}

#Preview {
    NewLocationView(title: "", details: "", lat: nil, long: nil, phoneNumber: "")
}
