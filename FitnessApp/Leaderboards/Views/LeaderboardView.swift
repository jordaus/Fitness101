//
//  LeaderboardView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 3/15/24.
//

import SwiftUI

struct LeaderboardUser : Codable, Identifiable {
    let id = UUID()
    let username : String
    let count : Int
}

class LeaderboardViewModel : ObservableObject {
    var mockData = [
        LeaderboardUser(username: "Jordan", count: 777),
        LeaderboardUser(username: "Zhane", count: 333),
        LeaderboardUser(username: "Maui", count: 888),
        LeaderboardUser(username: "Cami", count: 222),
        LeaderboardUser(username: "Will", count: 444),
        LeaderboardUser(username: "Jordan", count: 777),
        LeaderboardUser(username: "Zhane", count: 333),
        LeaderboardUser(username: "Maui", count: 888),
        LeaderboardUser(username: "Cami", count: 222),
        LeaderboardUser(username: "Will", count: 444),
    ]
}

struct LeaderboardView: View {
    @StateObject var viewModel = LeaderboardViewModel()
    
    @Binding var showTerms : Bool
    var body: some View {
        VStack{
            Text("Leaderboards")
                .font(.largeTitle)
                .bold()
            HStack {
                Text("Name")
                    .bold()
                Spacer()
                Text("Steps")
                    .bold()
            }
            .padding()
            
            LazyVStack(spacing: 24) {
                ForEach(viewModel.mockData) { person in
                    HStack {
                        Text(person.username)
                        Spacer()
                        Text("\(person.count)")
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .fullScreenCover(isPresented: $showTerms) {
            TermsView()
        }
        .task {
            do {
                try await DatabaseManager.shared.postStepCountUpdateFor(username: "jordi", count: 1234)
            } catch {
                print(error.localizedDescription)
            }
        }
        .onAppear {
            print(Date().mondayDateFormat())
        }
    }
}

#Preview {
    LeaderboardView(showTerms: .constant(false))
}
