//
//  ContentViewModel.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/30/24.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    // keeps track if logged in
    @Published var userSession: FirebaseAuth.User?
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    // dependency injection (AuthService)
    init(authService: AuthService) {
        self.authService = authService
        
        setupSubscribers()
        authService.updateUserSession()
        
    }
    
    // receives value from AuthService
    // we use "$" since userSession is a published property
    // if value is not nil, then userSession is assigned the user
    private func setupSubscribers() {
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user
        }.store(in: &cancellables)
    }
    
}
