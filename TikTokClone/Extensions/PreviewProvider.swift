//
//  PreviewProvider.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/5/24.
//

import Foundation

// mock data for testing
struct DeveloperPreview {
    
    static var user = User(id: NSUUID().uuidString,
                           username: "lewis_hamilton",
                           email: "lewis@gmail.com",
                           fullname: "Lewis Hamilton")
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, username: "lewis_hamilton", email: "lewis@gmail.com", fullname: "Lewis Hamilton"),
        .init(id: NSUUID().uuidString, username: "michael_scott", email: "mike@gmail.com", fullname: "Michael Scott"),
        .init(id: NSUUID().uuidString, username: "dwight_shrute", email: "dwight@gmail.com", fullname: "Dwight Schrute"),
        .init(id: NSUUID().uuidString, username: "jim_halpert", email: "slimjim@gmail.com", fullname: "Jim Halpert")
    ]
}
