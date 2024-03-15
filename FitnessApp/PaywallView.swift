//
//  PaywallView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 2/11/24.
//

import SwiftUI
import RevenueCat

struct PaywallView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = PaywallViewModel()
    var body: some View {
        VStack(spacing: 16) {
            Text("Premium")
                .font(.largeTitle)
                .bold()
            
            Text("Get Big and Fit")
            Spacer()
            // Features
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "figure.run")
                    Text("Exercise boosts energy levels and promotes vitality.")
                        .lineLimit(1)
                        .font(.system(size: 14))
                }
                HStack {
                    Image(systemName: "figure.run")
                    Text("Exercise boosts energy levels and promotes vitality.")
                        .lineLimit(1)
                        .font(.system(size: 14))
                }
                HStack {
                    Image(systemName: "figure.run")
                    Text("Exercise boosts energy levels and promotes vitality.")
                        .lineLimit(1)
                        .font(.system(size: 14))
                }
            }
            Spacer()
            HStack{
                if let offering = viewModel.currentOffering {
                    ForEach(offering.availablePackages) { package in
                        Button {
                            Purchases.shared.purchase(package: package) { (transaction, customerInfo, error, userCancelled) in
                                if customerInfo?.entitlements["premium"]?.isActive == true {
                                    // Unlock that great "pro" content
                                    dismiss()
                                }
                            }
                        } label: {
                            VStack(spacing: 8){
                                Text(package.storeProduct.subscriptionPeriod?.durationTitle ?? "Subscription")
                                Text(package.storeProduct.localizedPriceString)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .frame(height: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green)
                        )
                    }
                }
            }
            .padding(.horizontal, 40)
            Button {
                Purchases.shared.restorePurchases { customerInfo, error in
                    // ... check customerInfo to see if entitlement is now active
                    if customerInfo?.entitlements["premium"]?.isActive == true {
                        // Unlock that great "pro" content
                        dismiss()
                    }
                }
            } label: {
                Text("Restore Purchases")
                    .foregroundColor(.green)
                    .underline()
            }
            Spacer()
            
            HStack{
                Link("Terms of Use (ELUA)", destination: URL(string: "https://github.com/jordaus")!)
                Link("Privacy Policy", destination: URL(string: "https://github.com/jordaus")!)
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    PaywallView()
}
