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
    @State private var showConfetti = false
    @State private var region: MKCoordinateRegion
    @State private var lookAroundScene: MKLookAroundScene?
    @State private var isLookingAround = false
    
    private var location: Location

    init(location: Location) {
        self.location = location
        let spanDelta = location.coordinate != nil ? 0.01 : 0.20
        self.region = MKCoordinateRegion(
                center: location.coordinate ?? CLLocationCoordinate2D(latitude: 53.79826, 
                                                                      longitude: -1.53343),
                span: MKCoordinateSpan(latitudeDelta: spanDelta, longitudeDelta: spanDelta))
    }
    
    var body: some View {
        ZStack {
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

            if showCheekyPrawn && showConfetti {
                PrawnConfettiView(
                    numberOfConfetti: 200, 
                    animationDuration: 1,
                    onComplete: { 
                        showConfetti = false
                    }
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
    }

    private func toggleCheekyPrawn() {
        showCheekyPrawn.toggle()
        showConfetti = showCheekyPrawn
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
            title: "A Place With A Location",
            details: "The Place",
            coordinate: CLLocationCoordinate2D(latitude: 41.882683, longitude: -87.623321),
            phoneNumber: nil
        )
    )
}

#Preview {
    DetailsView(
        location: Location(
            title: "A Place Without A Location",
            details: "The Place",
            coordinate: nil,
            phoneNumber: nil
        )
    )
}
