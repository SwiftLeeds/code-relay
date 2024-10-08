//
//  HomeView.swift
//  Code Relay
//
//  Created by Mikaela Caron on 10/8/24.
//

import SwiftUI

struct HomeView: View {
    
   var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.locationsData) { location in
                    NavigationLink(location.id) { 
                        DetailsView(location: location)
                    }
                }
            }
            .navigationTitle("Guide to Leeds")
        }
    }
}

#Preview {
    HomeView()
}
