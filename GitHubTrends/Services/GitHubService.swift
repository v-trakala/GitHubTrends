//
//  GitHubService.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import Foundation

protocol GitHubServiceProtocol {
    func getRepositories() async throws -> [Repository]
}

final class GitHubService: GitHubServiceProtocol {
    
    private let urlSession: URLSession = .shared
    static let shared = GitHubService()
        
    private init() {}
    
    func getRepositories() async throws -> [Repository] {
        let url = "https://api.github.com/search/repositories?q=stars:%3E1&sort=stars&order=desc"
        let (data, _) = try await urlSession.data(from: URL(string: url)!)
        
        guard let response = decodeJSON(type: Repositories.self, data: data) else {
            throw NSError(domain: "Decoding Error", code: 1001)
        }
        return response.items
    }
}


// MARK: - Helpers

extension GitHubService {
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let data = data, let response = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return response
    }
}
