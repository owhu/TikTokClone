//
//  TikTokCloneApp.swift
//  TikTokClone
//
//  Created by Oliver Hu on 8/13/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TikTokCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            // dependency injection
            ContentView(authService: authService)
        }
    }
}
