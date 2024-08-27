//
//  StandardTextfieldModifier.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/27/24.
//

import SwiftUI

struct StandardTextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
