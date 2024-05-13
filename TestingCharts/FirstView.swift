//
//  FirstView.swift
//  TestingCharts
//
//  Created by Oscar Epp on 5/9/24.
//

import SwiftUI
import Charts

struct data: Identifiable {
    let name: String
    let value: Int
    
    var id: String { name }
}

let dataset: [data] = [
    .init(name: "First bar", value: 916),
    .init(name: "Second bar", value: 850),
    .init(name: "Third bar", value: 802),
    .init(name: "Fourth bar", value: 910),
    .init(name: "Fifth bar", value: 777),
]

struct FirstView: View {
    var body: some View {
        
        Chart {
            ForEach(dataset) { element in
                
                BarMark(
                    x: .value("Amount", element.value),
                    y: .value("Name", element.name)
                )

            }
        }
        
    }
}

#Preview {
    FirstView()
}
