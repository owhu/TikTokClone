//
//  AuthService.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/29/24.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    // allows views such as content view to see userSession
    @Published var userSession: FirebaseAuth.User?
    
    // if logged in then currentUser will have a value
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            // try to execute network request
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User is \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to log in user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullName: String) async throws {
        do {
            // try to execute network request
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User is \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout() {
        try? Auth.auth().signOut() // signs user out on backend
        self.userSession = nil // updates routing logic by wiping user session
    }
}
