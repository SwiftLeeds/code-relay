//
//  SpinWheelView.swift
//  GetYourFlushy
//
//  Created by Arnaud Wurmel on 09/10/2024.
//

import Charts
import SwiftUI

struct SpinWheelView: View {
    @StateObject var viewModel = SpinWheelViewModel()
    
    var body: some View {
        VStack {
            Text("If you also desired to have one of those flushy cats, train your luck before!")

            FlushyChartView(isAnimated: viewModel.isAnimating, data: viewModel.data)
                .animation(.smooth, value: viewModel.rotationAngle)
                .rotationEffect(.degrees(viewModel.rotationAngle))
                .overlay(alignment: .top) {
                    Image(systemName: "triangle.fill")
                        .font(.largeTitle)
                        .rotationEffect(.degrees(180))
                        .padding(.top, 70)
                        .foregroundStyle(.red)
                        .shadow(radius: 10)
                }
                        
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            Button("Spin the wheel") {
                viewModel.reset()
                
                withAnimation {
                    viewModel.spinWheel()
                } completion: {
                    viewModel.animationDidComplete()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isAnimating)
        }
        .padding()
        .navigationTitle("Train your luck")
    }
}

#Preview {
    NavigationView {
        SpinWheelView()
    }
}
