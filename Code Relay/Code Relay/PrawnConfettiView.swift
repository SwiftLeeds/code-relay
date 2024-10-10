//
//  PrawnConfettiView.swift
//  Code Relay
//
//  Created by John Martin on 10/10/2024.
//

import SwiftUI
import UIKit

struct PrawnConfettiView: UIViewRepresentable {
         
    let numberOfConfetti: Int
    let animationDuration: Double
    let onComplete: () -> Void
    
    // For all your prawn tastes
    enum PrawnStyle: String {
        case 🦐
        case 🍤
    }
    let prawnStyle = PrawnStyle.🦐
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        let emitter = CAEmitterLayer()
        emitter.emitterShape = .line
        emitter.emitterPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        emitter.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
        emitter.renderMode = .oldestLast
        emitter.beginTime = CACurrentMediaTime()

        let velocity: CGFloat = 600
        let velocityRange: CGFloat = 200
        let screenHeight = UIScreen.main.bounds.height
        let maxVelocity = velocity + velocityRange
        let fallDuration = Double(screenHeight / maxVelocity)

        let cell = CAEmitterCell()
        cell.contents = prawnStyle.image().cgImage
        cell.birthRate = Float(numberOfConfetti) / Float(animationDuration)
        cell.lifetime = Float(fallDuration) + Float(animationDuration)
        cell.velocity = velocity
        cell.velocityRange = velocityRange
        cell.emissionLongitude = .pi 
        cell.emissionRange = 0.6
        cell.scale = 0.6
        cell.scaleRange = 0.6
        cell.spin = 6
        cell.spinRange = 10
        cell.yAcceleration = 300

        emitter.emitterCells = [cell]

        view.layer.addSublayer(emitter)

        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            emitter.birthRate = 0 // Stop emitting new confetti
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration + Double(cell.lifetime)) {
            onComplete()
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

extension PrawnConfettiView.PrawnStyle {
    func image() -> UIImage {
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(rect)
        (self.rawValue as NSString).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
