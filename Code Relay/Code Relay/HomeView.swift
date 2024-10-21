//
//  HomeView.swift
//  Code Relay
//
//  Created by Mikaela Caron on 10/8/24.
//

import SwiftUI

struct HomeView: View {
    @State var showAddNewLocation: Bool = false
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.locationsData) { location in
                    NavigationLink(location.id) { 
                        DetailsView(location: location)
                    }
                }
            }
            .toolbar { 
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddNewLocation = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add new location")
                }
            }
            .navigationTitle("Guide to Leeds")
        }
        .sheet(isPresented: $showAddNewLocation) { 
            NewLocationView(title: "", details: "", phoneNumber: "")
        }
        .onReceive(NotificationCenter.default.publisher(for: .newLocation)) { notification in
            guard let location = notification.userInfo?["location"] as? Location else {
                return 
            }
            viewModel.locationsData.append(location)
        }

    }
}

#Preview {
    HomeView()
}
