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
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray5))
            
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
