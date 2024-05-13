//
//  ThirdView.swift
//  TestingCharts
//
//  Created by Oscar Epp on 5/9/24.
//

import SwiftUI
import Charts


struct TemperatureSeries: Identifiable {
    let city: String
    let temperatures: [TemperatureData]
    var id: String { city }
}

struct TemperatureData {
    let day: String
    let Temperature: Double
}


struct ThirdView: View {
    var seriesData: [TemperatureSeries]

    var body: some View {
        Chart {
            ForEach(Array(zip(seriesData[0].temperatures, seriesData[1].temperatures)), id: \.0.day) { (high, low) in
                AreaMark(
                    x: .value("Day", high.day),
                    yStart: .value("Low Temperature", low.Temperature),
                    yEnd: .value("High Temperature", high.Temperature)
                )
//                .foregroundStyle(by: .value("City", seriesData[0].city))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.3), .green.opacity(0.3), .purple.opacity(0.3)]), startPoint: .bottom, endPoint: .top))
                .interpolationMethod(.catmullRom)
                
                LineMark(
                    x: .value("Day", high.day),
                    y: .value("High Temperature", high.Temperature)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", seriesData[0].city))

                LineMark(
                    x: .value("Day", low.day),
                    y: .value("Low Temperature", low.Temperature)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(by: .value("City", seriesData[1].city))
            }
        }
        .chartForegroundStyleScale(["High": .purple, "Low": .blue
        ])
        .chartYScale(domain: 0...30)
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


// Example data
struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(seriesData: [
            TemperatureSeries(city: "High", temperatures: [
                TemperatureData(day: "Mon", Temperature: 25),
                TemperatureData(day: "Tue", Temperature: 20),
                TemperatureData(day: "Wed", Temperature: 21),
                TemperatureData(day: "Thu", Temperature: 15),
                TemperatureData(day: "Fri", Temperature: 19),
                TemperatureData(day: "Sat", Temperature: 25),
                TemperatureData(day: "Sun", Temperature: 27)
            ]),
            TemperatureSeries(city: "Low", temperatures: [
                TemperatureData(day: "Mon", Temperature: 15),
                TemperatureData(day: "Tue", Temperature: 10),
                TemperatureData(day: "Wed", Temperature: 10),
                TemperatureData(day: "Thu", Temperature: 5),
                TemperatureData(day: "Fri", Temperature: 9),
                TemperatureData(day: "Sat", Temperature: 15),
                TemperatureData(day: "Sun", Temperature: 17)
            ])
        ])
    }
}
