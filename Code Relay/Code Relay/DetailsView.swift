//
//  DetailsView.swift
//  Code Relay
//
//  Created by Sebastian Bolling on 2024-10-08.
//

import SwiftUI
import MapKit

struct DetailsView: View {
   
    @State private var showCheekyPrawn = false
    @State private var region: MKCoordinateRegion
    @State private var location: Location
    @State private var lookAroundScene: MKLookAroundScene?
    @State private var isLookingAround = false

    init(location: Location) {
        self.location = location
        self.region = MKCoordinateRegion(
                center: location.coordinate ?? CLLocationCoordinate2D(latitude: 53.8059743, 
                                                                      longitude: -1.6181322),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
    var body: some View {
        VStack {
            Map(initialPosition: .region(
                MKCoordinateRegion(
                    center: location.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0), 
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
            ))
            .frame(height: 400)
            .frame(maxWidth: .infinity)
            .onAppear {
                getLookAroundScene()
            }
            .lookAroundViewer(isPresented: $isLookingAround, initialScene: lookAroundScene)
            .overlay(alignment: .bottomTrailing) {
                if lookAroundScene != nil {
                    Button {
                        isLookingAround.toggle()
                    } label: {
                        Image(systemName: "binoculars.fill")
                            .foregroundStyle(Color(.secondaryLabel))
                            .frame(width: 40, height: 40)
                            .background(Color(.tertiarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.all, 8)
                }
            }
            
            Text(location.title).fontWeight(.bold)
            Text(location.details).onTapGesture { toggleCheekyPrawn() }
            if showCheekyPrawn {
                Text("🦐").font(.largeTitle)
            }
            
            Spacer()
            
            if let phoneNumber = location.phoneNumber {
                Link("Call", destination: URL(string: "tel:\(phoneNumber)")!)
                    .padding()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }

    private func toggleCheekyPrawn() {
        showCheekyPrawn.toggle()
        // TODO: Prawn confetti please
    }
    
    private func getLookAroundScene() {
        lookAroundScene = nil
        Task {
            if let coordinate = location.coordinate {
                let request = MKLookAroundSceneRequest(coordinate: coordinate)
                do {
                    lookAroundScene = try await request.scene
                } catch {
                    print("Error getting look around scene: \(error)")
                }
            }
        }
    }
}

#Preview {
    DetailsView(
        location: Location(
            title: "A Place",
            details: "The Place",
            coordinate: CLLocationCoordinate2D(latitude: 41.882683, longitude: -87.623321),
            phoneNumber: nil
        )
    )
}
