//
//  ErrorView.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 14/03/2025.
//

import SwiftUI

struct ErrorView: View {
    let onTryAgain: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text("Something went wrong")
                .font(.title)
                .bold()
            
            Text("Unable to load repository details. Please try again later.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Button(action: onTryAgain) {
                Text("Try Again")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 32)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ErrorView {}
}
