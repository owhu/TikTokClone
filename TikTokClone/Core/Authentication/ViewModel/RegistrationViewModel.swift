//
//  RegistrationViewModel.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/29/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let authService: AuthService
    
    // example of dependency injection
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(withEmail email: String, 
                    password: String,
                    username: String,
                    fullName: String) async {
        do {
            try await authService.createUser(withEmail: email, 
                                             password: password,
                                             username: username,
                                             fullName: fullName)
        } catch {
            print("DEBUG: Did fail to create user with error \(error.localizedDescription).")
        }
    }
}
