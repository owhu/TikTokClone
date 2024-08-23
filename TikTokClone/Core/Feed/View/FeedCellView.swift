//
//  FeedCellView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/20/24.
//

import SwiftUI
import AVKit

struct FeedCellView: View {
    let post: Post
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                    .containerRelativeFrame([.horizontal, . vertical])
//            if let url = URL(string: post.videoUrl) {
//                VideoPlayer(player: AVPlayer(url: url))
//                    .containerRelativeFrame([.horizontal, .vertical])
//            } else {
//                Text("Invalid video URL")
//            }
//            
//            if let url = URL(string: post.videoUrl) {
//                CustomVideoPlayer(player: AVPlayer(url: url))
//                    .containerRelativeFrame([.horizontal, .vertical])
//            } else {
//                Text("Invalid video URL")
//            }
            
            VStack {
                Spacer()
                
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("luke.skywalker")
                            .fontWeight(.semibold)
                        
                        Text("Swiiiiing")
                        
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                                        
                    Spacer()
                    
                    VStack(spacing: 28) {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("1")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("1")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    FeedCellView(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
}
