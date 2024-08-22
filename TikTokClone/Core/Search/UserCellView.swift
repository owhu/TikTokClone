//
//  UserCellView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/21/24.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray5))
            
            VStack(alignment: .leading) {
                Text("test.user")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Test Name")
                    .font(.footnote)
                
            }
            .foregroundStyle(.black)
            .font(.subheadline)
            
            Spacer()
        }

    }
}

#Preview {
    UserCellView()
}
