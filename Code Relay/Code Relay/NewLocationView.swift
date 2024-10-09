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
                    TextField("Details", text: $details)
                    TextField("Coordinate lat", value: $lat, format: .number)
                    TextField("Coordinate long", value: $long, format: .number)
                    TextField("Phone number", text: $phoneNumber)
                }
                Button { 
                    let coordinate: CLLocationCoordinate2D? = if let lat, let long {
                        .init(latitude: lat, longitude: long)
                    } else { 
                        nil
                    }
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
