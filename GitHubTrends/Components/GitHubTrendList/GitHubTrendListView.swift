//
//  GitHubTrendListView.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import SwiftUI

struct GitHubTrendListView: View {
    @State private var isDarkMode: Bool = false
    
    @State var viewModel: GitHubTrendListViewModelProtocol
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else if viewModel.hasError {
                    ErrorView {
                        Task {
                            await viewModel.getRepositories()
                        }
                    }
                } else {
                    trends
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationTitle("GitHub Trends")
            .navigationDestination(for: Repository.self, destination: { repository in
                RepositoryDetailsView(repository: repository)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(isDarkMode ? .yellow : .blue)
                    }
                }
            }
        }
        .task {
            await viewModel.getRepositories()
        }
    }
    
    var trends: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.repostiories, id: \.id) { repository in
                        NavigationLink(value: repository) {
                            GitHubCard(repository: repository)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        
    }
}

#Preview {
    GitHubTrendListView(viewModel: GitHubTrendListViewModel())
}
