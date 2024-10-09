//
//  FlushyChartData.swift
//  GetYourFlushy
//
//  Created by Arnaud Wurmel on 09/10/2024.
//

import Foundation

struct FlushyChartData: Identifiable {
    let id = UUID()
    let prize: FlushyPrize
    let value: Double = 1
}
