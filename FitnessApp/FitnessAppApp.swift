//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Jordan Austin on 10/30/23.
//

import SwiftUI
import RevenueCat

@main
struct FitnessAppApp: App {
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
