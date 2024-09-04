//
//  LogInViewModel.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/29/24.
//

import Foundation

class LogInViewModel: ObservableObject {
    
    private let authService: AuthService
    
    // example of dependency injection
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Did fail to log in with error \(error.localizedDescription).")
        }
    }
}
