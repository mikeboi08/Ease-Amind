//
//  Zipper.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 1/24/24.
//
import SwiftUI

struct Zipper: View {
    
    @Binding var value: Double
    @State var lastCoordinateValue: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.height * 0.4
            let radius = gr.size.height * 0.5
            let minValue = 0 * 0.015
            let maxValue = (750 * 0.98) - thumbSize
            
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(.clear)
                HStack {
                    Image("Zipper2")
                        .foregroundColor(Color.white)
                        .frame(width: thumbSize, height: thumbSize)
                        .scaleEffect(CGSize(width: 0.50, height: 0.50))
                        .offset(x: -25)
                        .rotationEffect(Angle(degrees: -90))
                        .offset(x: self.value)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if value != 0 {
                                        let generator = UIImpactFeedbackGenerator(style: .rigid)
                                        generator.impactOccurred()
                                    }
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = self.value
                                    }
                                    if v.translation.width > 0 {
                                        self.value = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                    } else {
                                        self.value = max(minValue, self.lastCoordinateValue + v.translation.width)
                                    }
                                }
                        )
                    Spacer()
                }
            }
            .rotationEffect(Angle(degrees: 90))
        }
    }
}

#Preview {
    Zipper(value: .constant(1.0))
}
