//
//  EditProfileView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/9/24.
//

import SwiftUI

struct EditProfileView: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 8) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(Color(.systemGray5))
                    Button("Change photo") {
                        print("DEBUG: Change photo pressed.")
                    }
                    .foregroundStyle(.black)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("Username")
                        
                        Spacer()
                        
                        Text(user.username)
                    }
                    
                    HStack {
                        Text("Bio")
                        
                        Spacer()
                        
                        Button("Add a bio") {
                            print("DEBUG: Add bio here")
                        }
                        .foregroundStyle(.black)
                    }
                    
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}
