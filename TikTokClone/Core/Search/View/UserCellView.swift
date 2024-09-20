//
//  UserCellView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/21/24.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            AvatarView(user: user, size: .medium)                
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
                
            }
            .foregroundStyle(.black)
            .font(.subheadline)
            
            Spacer()
        }

    }
}

#Preview {
    UserCellView(user: DeveloperPreview.user)
}
