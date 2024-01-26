//
//  ChartDataView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 1/25/24.
//

import SwiftUI

struct ChartDataView: View {
    @State var average : Int
    @State var total : Int
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 16){
                Text("Average")
                    .font(.title2)
                Text("\(average)")
                    .font(.title3)
            }
            .frame(width: 90)
            .foregroundColor(.black)
            .padding()
            .background(.gray.opacity(0.07))
            .cornerRadius(12)
            
            Spacer()
            
            VStack(spacing: 16){
                Text("Total")
                    .font(.title2)
                Text("\(total)")
                    .font(.title3)
            }
            .frame(width: 90)
            .foregroundColor(.black)
            .padding()
            .background(.gray.opacity(0.07))
            .cornerRadius(12)
            
            Spacer()
        }
    }
}

#Preview {
    ChartDataView(average: 1111, total: 2222)
}
