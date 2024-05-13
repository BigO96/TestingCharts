//
//  SecondView.swift
//  TestingCharts
//
//  Created by Oscar Epp on 5/9/24.
//

import SwiftUI
import Charts

struct Milestone: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
}

extension Milestone {
    static let sampleData: [Milestone] = [
        Milestone(name: "Project Start", date: Date(timeIntervalSinceNow: -86400 * 30)),
        Milestone(name: "Phase 1 Complete", date: Date(timeIntervalSinceNow: -86400 * 15)),
        Milestone(name: "Phase 2 Complete", date: Date()),
        Milestone(name: "Project End", date: Date(timeIntervalSinceNow: 86400 * 15))
    ]
}

struct TimelineChartView: View {
    var body: some View {
        Chart {
            ForEach(Milestone.sampleData) { milestone in
                PointMark(
                    x: .value("Milestone", milestone.name),
                    y: .value("Date", milestone.date)
                )
                .symbol(by: .value("Milestone", milestone.name))
            }
        }
        .chartXAxis {
            AxisMarks(position: .bottom, values: .stride(by: .day))
        }
        .padding()
    }
}

#Preview {
    TimelineChartView()
}
