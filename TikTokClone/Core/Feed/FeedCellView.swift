//
//  FeedCellView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/20/24.
//

import SwiftUI

struct FeedCellView: View {
    let post: Int
    var body: some View {
        ZStack {
            Rectangle()
                    .fill(.pink)
                    .containerRelativeFrame([.horizontal, . vertical])
                    .overlay {
                        Text("Post \(post)")
                            .foregroundStyle(.white)
                    }
            
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
    }
}

#Preview {
    FeedCellView(post: 1)
}
