//
//  SpinWheelViewModel.swift
//  GetYourFlushy
//
//  Created by Arnaud Wurmel on 09/10/2024.
//

import Foundation

class SpinWheelViewModel: ObservableObject {
    let data: [FlushyChartData] = Array(
        repeating: FlushyPrize.allCases.map {
            FlushyChartData(prize: $0)
        },
        count: 4
    ).flatMap { $0 }
        
    @Published private(set) var isAnimating: Bool = false
    @Published private(set) var rotationAngle: Double = 0
    
    func spinWheel() {
        let initialNumberOfSpins: Double = 5
        
        let wonItemRatio = Double.random(in: 0...1)
        
        isAnimating = true
        rotationAngle = (initialNumberOfSpins + wonItemRatio) * 360
    }
    
    func animationDidComplete() {
        isAnimating = false
    }
    
    func reset() {
        rotationAngle = 0
    }
}
