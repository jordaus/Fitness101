//
//  WorkoutCard.swift
//  FitnessApp
//
//  Created by Jordan Austin on 11/26/23.
//

import SwiftUI

struct Workout {
    let id : Int
    let title : String
    let image : String
    let duration : String
    let colorTint : Color
    let date : String
    let calories : String
}
struct WorkoutCard: View {
    @State var workout : Workout
    
    var body: some View {
        HStack {
            Image(systemName : workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.colorTint)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(workout.duration)
                }
                HStack {
                    Text(workout.date)
                    Spacer()
                    Text(workout.calories)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run",  duration: "23 Mins", colorTint: .cyan, date: "Nov 26", calories: "341 kCal"))
}
