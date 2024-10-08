//
//  SettingsView.swift
//  Code Relay
//
//  Created by Mikaela Caron on 10/8/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            Text("Developed at ") +
            Text("SwiftLeeds")
                .font(.title)
                .bold()
                .foregroundStyle(.red)
            ScrollView {
                ForEach(viewModel.contributors, id: \.id) { contributor in
                    ContributorCardView(contributor: contributor)
                        .padding(.horizontal)
                }
            }
        }
        .task {
            await viewModel.fetchContributors()
        }
    }
}

private struct ContributorCardView: View {
    let contributor: Contributor
    
    var body: some View {
        HStack {
            if let avatarData = contributor.avatarData, let uiImage = UIImage(data: avatarData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(contributor.login)
                    .font(.headline)
                Text("\(contributor.contributions) contributions")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    SettingsView()
}
