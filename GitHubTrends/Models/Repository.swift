//
//  Repository.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import Foundation

struct Repositories: Decodable {
    let items: [Repository]
}

struct Repository: Decodable, Hashable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let htmlUrl: String
    let language: String?
    let forksCount: Int
    let topics: [String]
    let owner: Owner
}


struct Owner: Decodable, Hashable {
    let id: Int
    let login: String
    let avatarUrl: String
}
