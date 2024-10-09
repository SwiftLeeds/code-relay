//
//  FlushyChartView.swift
//  GetYourFlushy
//
//  Created by Arnaud Wurmel on 09/10/2024.
//

import Charts
import Foundation
import SwiftUI

struct FlushyChartView: View {
    let isAnimated: Bool
    
    let data: [FlushyChartData]

    private var total: Double {
        Double(data.count)
    }

    var body: some View {
        Chart {
            ForEach(data) { flushyChartData in
                if !isAnimated {
                    SectorMark(
                        angle: .value("Value", flushyChartData.value),
                        innerRadius: .ratio(0.2),
                        angularInset: 0
                    )
                    .annotation(position: .overlay) {
                        if !isAnimated {
                            Text(flushyChartData.prize.rawValue)
                        }
                    }
                    .foregroundStyle(by: .value("Category", flushyChartData.prize.rawValue))
                } else {
                    SectorMark(
                        angle: .value("Value", flushyChartData.value),
                        innerRadius: .ratio(0.2),
                        angularInset: 1
                    )
                    .foregroundStyle(by: .value("Category", flushyChartData.prize.rawValue))
                }
            }
        }
        .chartLegend(.hidden)
    }
}
