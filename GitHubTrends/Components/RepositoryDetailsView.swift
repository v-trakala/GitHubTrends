//
//  RepositoryDetailsView.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import SwiftUI

struct RepositoryDetailsView: View {
    let repository: Repository
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    AsyncImage(url: URL(string: repository.owner.avatarUrl)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(repository.owner.login)
                            .font(.headline)
                        Text("ID: \(repository.owner.id)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                Text(repository.name)
                    .font(.title)
                    .bold()
                
                Text(repository.fullName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(repository.description ?? "No description.")
                    .font(.body)
                    .padding(.top, 8)
                
                Divider()
                
                HStack {
                    StatisticsView(
                        iconName: "star.fill",
                        value: repository.stargazersCount,
                        label: "Stars")
                    Spacer()
                    StatisticsView(
                        iconName: "tuningfork",
                        value: repository.forksCount,
                        label: "Forks")
                }
                
                Divider()
                
                if let language = repository.language {
                    HStack {
                        Text("Language:")
                            .font(.headline)
                        Text(language)
                            .font(.body)
                            .foregroundColor(.blue)
                    }
                }
                
                Divider()
                
                if !repository.topics.isEmpty {
                    Text("Topics:")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(repository.topics, id: \.self) { topic in
                                Text(topic)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                
                Divider()
                
                if !repository.htmlUrl.isEmpty {
                    Link("Open Repository", destination: URL(string: repository.htmlUrl)!)
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .background(
            Image("GitHubTrends")
                .resizable()
                .foregroundColor(.cardBackground)
                .frame(width: 400, height: 400)
                .offset(x: UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 3.5)
        )
        .navigationTitle("Repository Details")
    }
}

struct StatisticsView: View {
    let iconName: String
    let value: Int
    let label: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.yellow)
            Text("\(value)")
                .font(.headline)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    RepositoryDetailsView(repository: Repository(
        id: 123,
        name: "Valera",
        fullName: "Valera",
        description: "Description",
        stargazersCount: 20,
        htmlUrl: "https://github.com/valera",
        language: "Swift",
        forksCount: 23,
        topics: ["TS", "JS"],
        owner: Owner(
            id: 1223,
            login: "valera_owner",
            avatarUrl: "https://via.placeholder.com/50"
        )
    ))
}

