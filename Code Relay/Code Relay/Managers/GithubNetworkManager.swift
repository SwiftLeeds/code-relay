//
//  NetworkManager.swift
//  Code Relay
//
//  Created by Gerald.Wood on 10/8/24.
//

import Foundation

class GithubNetworkManager {
    static let shared = GithubNetworkManager()
    let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getContributors(atURL urlString: String) async throws -> [Contributor] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidRepoURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let codingData = try decoder.decode([Contributor.CodingData].self, from: data)
            return codingData.map { $0.contributor }.sorted { $0.contributions > $1.contributions }
        } catch {
            throw NetworkError.invalidRepoData
        }
    }
}

enum NetworkError: Error {
    case invalidRepoURL
    case invalidResponse
    case invalidRepoData
}
