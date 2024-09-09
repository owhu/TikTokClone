//
//  User.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/5/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    var bio: String?
    var profileImageUrl: String?
}

extension User: Hashable { }
