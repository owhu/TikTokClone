//
//  FeedView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/20/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCellView(post: post, player: player)
                        .id(post.id)
                        .onAppear { playInitialVideoIfNecessary() }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear { player.play() }
        .onDisappear { player.pause() }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPosition == nil,
              let post = viewModel.posts.first,
              player.currentItem == nil else { return }
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
        player.play()
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
//        player.play()
    }
}

#Preview {
    FeedView()
}
