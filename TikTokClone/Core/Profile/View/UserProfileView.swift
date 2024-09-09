//
//  UserProfileView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/6/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                // profile header
                ProfileHeaderView(user: user)
                // post grid view
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
