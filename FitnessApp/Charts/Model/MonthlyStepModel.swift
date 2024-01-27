//
//  MonthlyStepModel.swift
//  FitnessApp
//
//  Created by Jordan Austin on 1/25/24.
//

import Foundation

struct MonthlyStepModel : Identifiable {
    let id = UUID()
    let date : Date
    let count : Int
}
