//
//  SettingsViewModel.swift
//  Code Relay
//
//  Created by Gerald.Wood on 10/8/24.
//

import Foundation
import SwiftUI

@MainActor final class SettingsViewModel: ObservableObject {
    @Published var contributors = [Contributor]()
    
    func fetchContributors() async {
        let repoURL = "https://api.github.com/repos/SwiftLeeds/code-relay/contributors"
        
        do {
            contributors = try await GithubNetworkManager.shared.getContributors(atURL: repoURL)
        } catch { 
            // We would never really do this, but YOLO!!!
            contributors = []
        }
    }
}
