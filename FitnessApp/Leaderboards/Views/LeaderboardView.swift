//
//  LeaderboardView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 3/15/24.
//

import SwiftUI

struct LeaderboardUser : Codable, Identifiable {
    let id : Int
    let createdAt : String
    let username : String
    let count : Int
}

class LeaderboardViewModel : ObservableObject {
    var mockData = [
        LeaderboardUser(id: 0, createdAt: "", username: "Jordan", count: 777),
        LeaderboardUser(id: 1, createdAt: "", username: "Zhane", count: 333),
        LeaderboardUser(id: 2, createdAt: "", username: "Maui", count: 888),
        LeaderboardUser(id: 3, createdAt: "", username: "Cami", count: 222),
        LeaderboardUser(id: 4, createdAt: "", username: "Will", count: 444),
        LeaderboardUser(id: 5, createdAt: "", username: "Jordan", count: 777),
        LeaderboardUser(id: 6, createdAt: "", username: "Zhane", count: 333),
        LeaderboardUser(id: 7, createdAt: "", username: "Maui", count: 888),
        LeaderboardUser(id: 8, createdAt: "", username: "Cami", count: 222),
        LeaderboardUser(id: 9, createdAt: "", username: "Will", count: 444),
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
                        Text("\(person.id).")
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
    }
}

#Preview {
    LeaderboardView(showTerms: .constant(false))
}
