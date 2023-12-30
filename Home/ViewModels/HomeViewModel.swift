//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Jordan Austin on 12/29/23.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    var calories : Int = 123
    var active : Int = 52
    var stand : Int = 8
    
    var mockActivities = [
        Activity(id: 0, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9821"),
        Activity(id: 1, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9821"),
        Activity(id: 2, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9821"),
        Activity(id: 3, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .yellow, amount: "9821")
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run",  duration: "23 Mins", colorTint: .cyan, date: "Nov 26", calories: "231 kCal"),
        Workout(id: 1, title: "Running", image: "figure.run",  duration: "25 Mins", colorTint: .mint, date: "Nov 27", calories: "341 kCal"),
        Workout(id: 2, title: "Running", image: "figure.run",  duration: "33 Mins", colorTint: .orange, date: "Nov 28", calories: "407 kCal"),
        Workout(id: 3, title: "Running", image: "figure.run",  duration: "40 Mins", colorTint: .indigo, date: "Nov 29", calories: "502 kCal")
    ]
}
