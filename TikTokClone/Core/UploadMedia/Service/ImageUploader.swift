//
//  ImageUploader.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/10/24.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    // firebase stores simple text, large data such as pictures and videos gets stored in storage bucket which uses a url string for sending/retrieving the data
    func uploadImage(image: UIImage) async throws -> String? {
        // compression 0 is lowest quality, 1 is highest
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error)")
            return nil
        }
    }
}

