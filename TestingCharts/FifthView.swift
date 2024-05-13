//
//  FifthView.swift
//  TestingCharts
//
//  Created by Oscar Epp on 5/13/24.
//

import SwiftUI
import Charts


struct FifthViewStruct: Identifiable {
    let city: String
    let temperatures: [FifthViewData]
    var id: String { city }
}

struct FifthViewData {
    let day: String
    let Temperature: Double
}


struct FifthView: View {
    var seriesData: [FifthViewStruct]
    
    var body: some View {
        VStack {
            Text("Mean Daily Steps")
                .font(.title)
                .padding(.bottom)
            Chart {
                ForEach(Array(zip(seriesData[0].temperatures, seriesData[1].temperatures)), id: \.0.day) { (control, intervention) in
                    LineMark(
                        x: .value("Day", control.day),
                        y: .value("High Temperature", control.Temperature)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("City", seriesData[0].city))
                    
                    LineMark(
                        x: .value("Day", intervention.day),
                        y: .value("Low Temperature", intervention.Temperature)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by: .value("City", seriesData[1].city))
                }
            }
            .chartYScale(domain: 7800...8800)
            .chartYAxis {
                AxisMarks(preset: .extended, position: .leading)
            }
            .chartXAxis {
                AxisMarks(preset: .aligned, position: .bottom)
            }
            .frame(height: 300)
            .padding()
        }
    }
}
struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView(seriesData: [
            FifthViewStruct(city: "Control", temperatures: [
                FifthViewData(day: "Baseline", Temperature: 8557),
                FifthViewData(day: "Intervention", Temperature: 7990),
            ]),
            FifthViewStruct(city: "Gamified", temperatures: [
                FifthViewData(day: "Baseline", Temperature: 8243),
                FifthViewData(day: "Intervention", Temperature: 8553),
            ])
        ])
    }
}
