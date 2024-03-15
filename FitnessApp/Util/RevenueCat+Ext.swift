//
//  RevenueCat+Ext.swift
//  FitnessApp
//
//  Created by Jordan Austin on 3/15/24.
//

import RevenueCat

extension SubscriptionPeriod {
    var durationTitle: String {
        switch self.unit {
        case .day : return "Daily"
        case .week : return "Weekly"
        case .month : return "Monthly"
        case .year : return "Annual"
        @unknown default : return "Unknown"
        }
    }
}
