//
//  Firestore+Constants.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/6/24.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
}
