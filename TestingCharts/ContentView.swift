//
//  ContentView.swift
//  TestingCharts
//
//  Created by Oscar Epp on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
//                FirstView()
                
                HStack(spacing: 20) {
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
                    .frame(height: 200)


//                    ThirdView(seriesData: [
//                        TemperatureSeries(city: "High", temperatures: [
//                            TemperatureData(day: "Mon", Temperature: 25),
//                            TemperatureData(day: "Tue", Temperature: 20),
//                            TemperatureData(day: "Wed", Temperature: 21),
//                            TemperatureData(day: "Thu", Temperature: 15),
//                            TemperatureData(day: "Fri", Temperature: 19),
//                            TemperatureData(day: "Sat", Temperature: 25),
//                            TemperatureData(day: "Sun", Temperature: 27)
//                        ]),
//                        TemperatureSeries(city: "Low", temperatures: [
//                            TemperatureData(day: "Mon", Temperature: 15),
//                            TemperatureData(day: "Tue", Temperature: 10),
//                            TemperatureData(day: "Wed", Temperature: 10),
//                            TemperatureData(day: "Thu", Temperature: 5),
//                            TemperatureData(day: "Fri", Temperature: 9),
//                            TemperatureData(day: "Sat", Temperature: 15),
//                            TemperatureData(day: "Sun", Temperature: 17)
//                        ])
//                    ])
//                    .frame(width: 250, height: 250)

                }
                .frame(height: 500)
            }
            .padding()
            

        }
    }
}

#Preview {
    ContentView()
}
