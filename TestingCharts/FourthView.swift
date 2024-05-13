//
//  FourthView.swift
//  TestingCharts
//
//  Created by Oscar Epp on 5/9/24.
//

import SwiftUI
import Charts

struct ActivityBarChartView: View {
    var body: some View {
        VStack {
            Text("Employment Status of Participants")
                .font(.title2)
                .padding(.bottom)
            
            Chart {
                ForEach(PhysicalActivity.sampleData) { activity in
                    BarMark(
                        x: .value("Category", activity.category),
                        y: .value("Control Group", activity.controlCount)
                    )
                    .foregroundStyle(.blue)
                    BarMark(
                        x: .value("Category", activity.category),
                        y: .value("Gamification Group", activity.gamificationCount)
                    )
                    .foregroundStyle(.green)
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic(desiredCount: 5))
            }
            .frame(height: 300)
            .padding()
        }
    }
}

struct PhysicalActivity: Identifiable {
    let id = UUID()
    var category: String
    var controlCount: Int
    var gamificationCount: Int
}
extension PhysicalActivity {
    static let sampleData: [PhysicalActivity] = [
        PhysicalActivity(category: "Ft Employed", controlCount: 14, gamificationCount: 38),
        PhysicalActivity(category: "Pt Employed", controlCount: 4, gamificationCount: 13),
        PhysicalActivity(category: "Ft Student", controlCount: 7, gamificationCount: 20),
        PhysicalActivity(category: "Pt Student", controlCount: 8, gamificationCount: 18),
    ]
}


#Preview {
    ActivityBarChartView()
}
