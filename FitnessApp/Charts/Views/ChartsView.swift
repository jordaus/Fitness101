//
//  HistoricDataView.swift
//  FitnessApp
//
//  Created by Jordan Austin on 11/12/23.
//

import SwiftUI
import Charts

struct DailyStepModel : Identifiable {
    let id = UUID()
    let date : Date
    let count : Double
}

enum ChartOptions: String, CaseIterable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}
class ChartsViewModel: ObservableObject {
    var mockChartData = [
        DailyStepModel(date: Date(), count: 12345),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 9975),
    ]
    @Published var mockMonthData = [DailyStepModel]()
    @Published var mockThreeMonthData = [DailyStepModel]()
    init() {
        
        var mockOneMonth = self.mockDataFor(days: 30)
        var mockThreeMonths = self.mockDataFor(days: 90)
        DispatchQueue.main.async {
            self.mockMonthData = mockOneMonth
            self.mockThreeMonthData = mockThreeMonths
        }
    }
    
    func mockDataFor(days: Int) -> [DailyStepModel] {
        var mockData = [DailyStepModel]()
        for i in 0..<days {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) ?? Date()
            let stepCount = Int.random(in: 8000...12000) // Generating random step count between 8000 and 12000
            let dailyStep = DailyStepModel(date: date, count: Double(stepCount))
            
            mockData.append(dailyStep)
        }
        return mockData
    }
}

struct ChartsView: View {
    @StateObject var viewModel = ChartsViewModel()
    @State var selectedChart : ChartOptions = .oneWeek
    var body: some View {
        VStack {
            Text("Charts")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
            ZStack {
                switch selectedChart {
                case .oneWeek:
                    Chart {
                        ForEach(viewModel.mockChartData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .oneMonth:
                    Chart {
                        ForEach(viewModel.mockMonthData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .threeMonth:
                    Chart {
                        ForEach(viewModel.mockThreeMonthData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .yearToDate:
                    EmptyView()
                case .oneYear:
                    Chart {
                        ForEach(viewModel.mockChartData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                }
            }
            .frame(maxHeight: 350)
            .foregroundColor(.green)
            .padding(.horizontal)
            
            HStack {
                ForEach(ChartOptions.allCases, id: \.rawValue) { option in
                    Button(option.rawValue) {
                        withAnimation {
                            selectedChart = option
                        }
                    }
                    .padding()
                    .foregroundColor(selectedChart == option ? .white : .green)
                    .background(selectedChart == option ? .green : .clear)
                    .cornerRadius(10)
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ChartsView()
}
