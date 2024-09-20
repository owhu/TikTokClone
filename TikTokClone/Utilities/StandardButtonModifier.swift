//
//  StandardButtonModifier.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/17/24.
//

import SwiftUI

struct StandardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 352, height: 44)
            .background(Color(.systemPink))
            .cornerRadius(8)
    }
}

