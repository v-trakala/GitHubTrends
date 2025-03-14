//
//  GitHubCard.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 13/03/2025.
//

import SwiftUI

struct GitHubCard: View {
    let repository: Repository
    let index: Int
    @State var startAnimation = false
    
    
    let icons = [
        "folder",
        "chevron.left.slash.chevron.right",
        "star",
        "arrow.triangle.branch",
        "doc.text",
        "sparkles",
        "externaldrive",
        "archivebox",
        "tray.full"
    ]
    
    var randomIcon: String {
        icons.randomElement() ?? "folder"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image(systemName: randomIcon)
                Text("\(repository.name)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color.cardTextPrimary)
            
            Text(repository.description ?? "No description available")
                .font(.body)
                .foregroundColor(Color.cardTextSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 25) {
                HStack {
                    Image(systemName: "tuningfork")
                        .foregroundColor(.green)
                    Text("Forks: \(repository.forksCount)")
                        .font(.subheadline)
                        .foregroundColor(Color.cardTextPrimary)
                }
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Stars: \(repository.stargazersCount)")
                        .font(.subheadline)
                        .foregroundColor(Color.cardTextPrimary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.cardBorder, lineWidth: 2)
        )
        .background(           RoundedRectangle(cornerRadius: 12)
            .fill(Color.cardBackground)
            .shadow(color: Color.cardShadow, radius: 5))

    }
}

#Preview {
    GitHubCard(
        repository: Repository(
            id: 123,
            name: "Valera",
            fullName: "Valera",
            description: "Description",
            stargazersCount: 20,
            htmlUrl: "",
            language: "",
            forksCount: 23,
            topics: ["1", "2"],
            owner: Owner(
                id: 1223,
                login: "",
                avatarUrl: "")),
        index: 1)
}
