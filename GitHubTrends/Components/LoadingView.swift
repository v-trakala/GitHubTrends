//
//  LoadingView.swift
//  GitHubTrends
//
//  Created by Valery Trakala on 14/03/2025.
//

import SwiftUI

struct LoadingView: View {
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State var count: Int = 0
    let offset: CGFloat = -20
    
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .offset(y: count == 1 ? offset : 0)
            Circle()
                .offset(y: count == 2 ? offset : 0)
            Circle()
                .offset(y: count == 3 ? offset : 0)
        }
        .foregroundStyle(.white)
        .frame(width: 80, height: 80)
        .padding()
        .background(Color.loaderBackground)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .onReceive(timer) { _ in
            withAnimation(.bouncy(duration: 0.2, extraBounce: 0.1)) {
                if count == 3 {
                    count = 0
                } else {
                    count += 1
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
