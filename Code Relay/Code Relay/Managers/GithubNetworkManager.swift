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
            //create a valid url
            guard let url = URL(string: urlString) else {
                throw NetworkError.invalidRepoURL
            }
            
            //do a URLSession to receive data and responce
            let (data, response) = try await URLSession.shared.data(from: url)
            
            //check if response is valid
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            //decoding the data
            do {
                let codingData = try decoder.decode([Contributor.CodingData].self, from: data)
                return codingData.map { $0.contributor }.sorted { $0.contributions > $1.contributions }
            } catch {
                throw NetworkError.invalidRepoData
            }
        }
    
    func downloadImageData(from urlString: String) async -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            return nil
        }
    }
}

enum NetworkError: Error {
    case invalidRepoURL
    case invalidResponse
    case invalidRepoData
}
