//
//  MediaSelectorView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/17/24.
//

import SwiftUI
import PhotosUI

struct MediaSelectorView: View {
    @State private var player = AVPlayer()
    @State private var showMediaPicker = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var mediaPreview: Movie?
    
    var body: some View {
        NavigationStack {
            VStack {
                // 4 mediaPreview exists, then CustomVideoPlayer created
                if let mediaPreview {
                    CustomVideoPlayer(player: player)
                        .onAppear {
                            player.replaceCurrentItem(with: .init(url: mediaPreview.url))
                            player.play()
                        }
                        .padding()
                }
            }
            // 2 when selectedItem changes, loadMediaPreview
            .task(id: selectedItem) {
                await loadMediaPreview(fromItem: selectedItem)
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { showMediaPicker.toggle() }
            // 1 selectedItem is linked to photosPicker and stored
            .photosPicker(isPresented: $showMediaPicker, selection: $selectedItem, matching: .videos)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Next") {
                        print("DEBUG: Go to the upload post")
                    }
                }
            }
        }
    }
}

// 3 checks if it exists, then transforms data into movie, which is possible because the struct Movie conforms to Transferable protocol
private extension MediaSelectorView {
    func loadMediaPreview(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        self.mediaPreview = try? await item.loadTransferable(type: Movie.self)
        
        
    }
}

#Preview {
    MediaSelectorView()
}
