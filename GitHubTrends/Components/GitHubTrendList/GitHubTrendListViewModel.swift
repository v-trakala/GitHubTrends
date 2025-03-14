//
//  GitHubTrendListViewModel.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import SwiftUI

protocol GitHubTrendListViewModelProtocol {
    var repostiories: [Repository] { get }
    
    var hasError: Bool { get }
    var isLoading: Bool { get }
    
    func getRepositories() async
}

@Observable class GitHubTrendListViewModel: GitHubTrendListViewModelProtocol {
    private var service: GitHubServiceProtocol
    
    var repostiories: [Repository] = []
    
    var hasError: Bool = false
    var isLoading: Bool = false
    
    init(service: GitHubServiceProtocol = GitHubService.shared) {
        self.service = service
    }
    
    func getRepositories() async {
        isLoading = true
        hasError = false
        
        do {
            repostiories = try await service.getRepositories()
        } catch {
            hasError = true
        }
        
        isLoading = false
    }
}
