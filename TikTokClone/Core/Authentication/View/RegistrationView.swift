//
//  RegistrationView.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/27/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var username = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // logo image
                Image("tiktok-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                // textfields
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextfieldModifier())
                    
                    TextField("Enter your password", text: $password)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextfieldModifier())
                    
                    TextField("Enter your full name", text: $name)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextfieldModifier())
                    
                    TextField("Enter your username", text: $username)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextfieldModifier())
                }
                
                
                // login button
                
                Button {
                    print("DEBUG: Login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
//                .disabled(email.isEmpty && password.isEmpty)
                
                Spacer()
                
                // go to sign up
                Divider()
                
                NavigationLink {
                    LoginView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }

            }
        }
    }
}

#Preview {
    RegistrationView()
}
