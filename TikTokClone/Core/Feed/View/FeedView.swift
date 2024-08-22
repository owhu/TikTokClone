//
//  FeedView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/20/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0..<10) { post in
                FeedCellView(post: post)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView()
}
