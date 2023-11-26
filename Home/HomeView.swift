//
//  HomeView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    @State var calories : Int = 123
    @State var active : Int = 52
    @State var stand : Int = 8
    
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
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        Spacer()
                        VStack{
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                
                                Text("123 kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                
                                Text("52 mins")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("8 hours")
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        //Used to make the progress circle
                        ZStack {
                            ProgressCircleView(progress: $calories, goal: 600, color: .red)
                            ProgressCircleView(progress: $active, goal: 60, color: .green)
                                .padding(.all,20)
                            ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                                .padding(.all,40)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text("Fitness Activity")
                            .font(.title2)
                        
                        Spacer()
                        
                        Button {
                            print("show more")
                        } label : {
                            Text("Show More")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                        ForEach(mockActivities, id: \.id) { activity in ActivityCardView(activity: activity)
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Recent Workouts")
                            .font(.title2)
                        
                        Spacer()
                        
                        NavigationLink {
                            EmptyView()
                        } label : {
                            Text("Show More")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                    }
                    
                    .padding(.horizontal)
                    .padding(.top)
                    
                    LazyVStack {
                        ForEach(mockWorkouts, id: \.id) { workout in WorkoutCard(workout: workout)
                            
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
