//
//  ChartsViewModel.swift
//  FitnessApp
//
//  Created by Jordan Austin on 1/25/24.
//

import Foundation

class ChartsViewModel: ObservableObject {
    let healthManager = HealthManager.shared
    var mockWeekChartData = [
        DailyStepModel(date: Date(), count: 12345),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 9975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 9975),
    ]
    var mockYTDChartData = [
        MonthlyStepModel(date: Date(), count: 12345),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 19975),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 12975),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 13975),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(), count: 16975),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date()) ?? Date(), count: 12975),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), count: 21275),
    ]
    @Published var mockMonthData = [DailyStepModel]()
    @Published var mockThreeMonthData = [DailyStepModel]()
    
    @Published var oneWeekAverage = 777
    @Published var oneWeekTotal = 888
    
    @Published var oneMonthAverage = 0
    @Published var oneMonthTotal = 0
    
    @Published var threeMonthAverage = 0
    @Published var threeMonthTotal = 0
    
    @Published var ytdChartData = [MonthlyStepModel]()
    @Published var ytdAverage = 0
    @Published var ytdTotal = 0
    
    @Published var oneYearChartData = [MonthlyStepModel]()
    @Published var oneYearAverage = 0
    @Published var oneYearTotal = 0
    
    init() {

        let mockOneMonth = self.mockDataFor(days: 30)
        let mockThreeMonths = self.mockDataFor(days: 90)
        DispatchQueue.main.async {
            self.mockMonthData = mockOneMonth
            self.mockThreeMonthData = mockThreeMonths
        }
        fetchYTDAndOneYearChartData()
    }
    
    func mockDataFor(days: Int) -> [DailyStepModel] {
        var mockData = [DailyStepModel]()
        for i in 0..<days {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) ?? Date()
            let stepCount = Int.random(in: 8000...12000) // Generating random step count between 8000 and 12000
            let dailyStep = DailyStepModel(date: date, count: (stepCount))
            
            mockData.append(dailyStep)
        }
        return mockData
    }
    
    func fetchYTDAndOneYearChartData() {
        healthManager.fetchYTDAndOneYearChartData { result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.ytdChartData = result.ytd
                    self.oneYearChartData = result.oneYear
                    
                    self.ytdTotal = self.ytdChartData.reduce(0, { $0 + $1.count})
                    self.oneYearTotal = self.oneYearChartData.reduce(0, { $0 + $1.count})
                    
                    self.ytdAverage = self.ytdTotal / Calendar.current.component(.month, from: Date())
                    self.oneYearAverage = self.oneWeekTotal / 12
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
}
