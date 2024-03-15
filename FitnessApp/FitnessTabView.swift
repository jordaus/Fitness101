//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 11/12/23.
//

import SwiftUI
import RevenueCat

struct FitnessTabView: View {
    @State var selectedTab = "Home"
    @State var isPremium = false
    //this is just initializing the colors and customs of the toolbar at the bottom
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.selected.iconColor = .green
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.green]
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(isPremium: $isPremium)
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ChartsView()
                .tag("Charts")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Charts")
                }
        }
        .onAppear {
            Purchases.shared.getCustomerInfo { customerInfo, error in
                isPremium = customerInfo?.entitlements["premium"]?.isActive == true
            }
        }
    }
}

#Preview {
    FitnessTabView()
}
