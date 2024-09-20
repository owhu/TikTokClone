//
//  UploadPostView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 9/17/24.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextField("Enter your caption", text: $caption, axis: .vertical)
                
                Spacer()
                
                Rectangle()
//                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
                    .foregroundStyle(.gray)
            }
            
            Divider()
            
            Spacer()
            
            Button{
                print("DEBUG: Upload post")
            } label: {
                Text("Post")
                    .modifier(StandardButtonModifier())
            }
        }
        .padding()
    }
}

#Preview {
    UploadPostView()
}
