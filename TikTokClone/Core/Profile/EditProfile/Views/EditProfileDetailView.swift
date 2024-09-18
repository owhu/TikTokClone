//
//  EditProfileDetailView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/9/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var value = ""
    
    let option: EditProfileOptions
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add your bio", text: $value)
                
                Spacer()
                
                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Divider()
            
            Text(subTitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear{ onViewAppear() }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

private extension EditProfileDetailView {
    var subTitle: String {
        switch option {
        case .name:
            return "Your full name can only be changed once every 7 days."
        case .username:
            return "Usernames can contain only letters, numbers, underscores, and periods."
        case .bio:
            return "Tell us a little bit about yourself."
        }
    }
    
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullname
        case .username:
            value = user.username
        case .bio:
            value = user.bio ?? ""
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(option: .username, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
