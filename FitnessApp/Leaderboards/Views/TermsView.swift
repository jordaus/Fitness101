//
//  TermsView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 3/15/24.
//

import SwiftUI

struct TermsView: View {
    @AppStorage("username") var username: String?
    @State var name = ""
    @State var acceptedterms = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Terms")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextField("Username", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
            
            HStack(alignment: .top) {
                Button {
                    withAnimation{
                        acceptedterms.toggle()
                    }
                } label: {
                    if acceptedterms {
                        Image(systemName: "square.inset.filled")
                    } else {
                        Image(systemName: "square")
                    }
                }
                Text("By checking you agree to the terms and enter into the leaderboard competition.")
            }
            
            Spacer()
                
            Button {
                if acceptedterms && name.count > 2 {
                    username = name
                    dismiss()
                }
            } label: {
                Text("Continue")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TermsView()
}
