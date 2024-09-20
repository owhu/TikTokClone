//
//  Movie.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/18/24.
//

import AVKit
import PhotosUI
import SwiftUI

// tranforms data into movie
struct Movie: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")
            
            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }
            
            try FileManager.default.copyItem(at: received.file, to: copy)
            
            return Movie(url: copy)
        }

    }
}
