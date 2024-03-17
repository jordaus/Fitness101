//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Jordan Austin on 10/30/23.
//

import SwiftUI
import RevenueCat
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FitnessAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init(){
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_MFpvRrGVRfHlbOWleUkhHPRGBEZ")
    }
    var body: some Scene {
        WindowGroup {
            FitnessTabView()
        }
    }
}
