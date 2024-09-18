//
//  EditProfileOptionRowView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/10/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    
    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
            
            Spacer()
            
            Text(value)
        }
        .foregroundStyle(.primary)
    }
}


#Preview {
    EditProfileOptionRowView(option: .name, value: "lewis.hamilton")
}
