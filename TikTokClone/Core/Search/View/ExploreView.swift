//
//  ExploreView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/21/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var users = DeveloperPreview.users
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(users) { user in
                        UserCellView(user: user)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView()
}
