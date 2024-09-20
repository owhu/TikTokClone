//
//  EditProfileManager.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/10/24.
//

import FirebaseAuth
import Firebase
import UIKit

class EditProfileManager: ObservableObject {
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    // upload to storage
    func uploadProfileImage(_ uiImage: UIImage) async {
        do {
            let profileImageUrl = try await imageUploader.uploadImage(image: uiImage)
            try await updateUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG: Handle image upload error here")
        }
    }
    // update database
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await FirestoreConstants.UsersCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
}
