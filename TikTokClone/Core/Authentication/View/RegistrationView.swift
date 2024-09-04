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
    @State private var fullName = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RegistrationViewModel
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
        
        let vm = RegistrationViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
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
                
                TextField("Enter your full name", text: $fullName)
                    .modifier(StandardTextfieldModifier())
                
                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextfieldModifier())
            }
            
            
            // login button
            
            Button {
                Task { await viewModel.createUser(withEmail: email,
                                                  password: password,
                                                  username: username,
                                                  fullName: fullName)
                }
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1 : 0.7)
            
            Spacer()
            
            // go to sign up
            Divider()
            
            Button {
                dismiss()
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
        .navigationBarBackButtonHidden()
    }
}

// MARK: - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && !fullName.isEmpty
        && !username.isEmpty
    }
}
#Preview {
    RegistrationView(authService: AuthService())
}
