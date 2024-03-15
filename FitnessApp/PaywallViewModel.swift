//
//  PaywallViewModel.swift
//  FitnessApp
//
//  Created by Jordan Austin on 3/15/24.
//

import Foundation
import RevenueCat

class PaywallViewModel : ObservableObject {
    @Published var currentOffering : Offering?
    
    init() {
        Purchases.shared.getOfferings { (offerings, error) in
                    if let offering = offerings?.current {
                        DispatchQueue.main.async {
                            self.currentOffering = offering
                        }
                    }
                }
    }
}
