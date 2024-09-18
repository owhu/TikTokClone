//
//  ProfileHeaderVIew.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/22/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                Text("@\(user.username)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            // stats view
            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Following")
                
                UserStatView(value: 1, title: "Followers")
                
                UserStatView(value: 7, title: "Likes")
            }
            
            // action button
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Divider()
   
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}


