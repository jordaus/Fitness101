//
//  ProgressCircleView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 11/12/23.
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress : Int
    var goal : Int
    var color : Color
    private let width : CGFloat = 20
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width)
            
            Circle()
                .trim(from: 0, to: CGFloat(progress)/CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .padding()
    }
}

//XCode 14 Preview
/*
struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: .constant(100), goal: 200, color: .red)
    }
}*/

//XCode 15 Preview (use this)
#Preview {
    ProgressCircleView(progress: .constant(100), goal: 200, color: .red)
}
