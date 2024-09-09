//
//  ExploreView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/21/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel(userService: MockUserService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCellView(user: user)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self) { user in
                UserProfileView(user: user)
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
