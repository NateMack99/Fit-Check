//
//  Fit_CheckApp.swift
//  Fit-Check
//
//  Created by Nate Mackintosh on 10/2/24.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Fit_CheckApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
