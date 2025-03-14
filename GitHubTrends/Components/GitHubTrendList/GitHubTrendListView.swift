//
//  GitHubTrendListView.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import SwiftUI

struct GitHubTrendListView: View {
    @State private var isDarkMode: Bool = false
    @State private var shownCards: [Bool] = []

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
        ScrollView {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 0)
            
            VStack(spacing: 20) {
                ForEach(Array(viewModel.repostiories.enumerated()), id: \.element) { index, repository in
                    if shownCards.indices.contains(index) && shownCards[index] {
                        NavigationLink(value: repository) {
                            GitHubCard(repository: repository, index: index)
                        }
                        .padding(.horizontal)
                        .transition(.move(edge: .trailing))
                        .animation(.spring(duration: 0.5).delay(Double(index) * 0.1))
                    }
                }
            }
        }
        .onAppear {
            shownCards = Array(repeating: false, count: viewModel.repostiories.count)
            
            for index in viewModel.repostiories.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    shownCards[index] = true
                }
            }
        }
    }
}

#Preview {
    GitHubTrendListView(viewModel: GitHubTrendListViewModel())
}
