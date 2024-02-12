//
//  Zip3.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 2/12/24.
//

import SwiftUI

struct Zip2: View {
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
                    .foregroundColor(.gray)
                HStack {
                    //Circle()
                    Image("Zipper")
                        .foregroundColor(Color.white)
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: self.value)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if value.truncatingRemainder(dividingBy: 2) == 0 && value != 0{
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
            //.rotationEffect(Angle(degrees: 90))
        }
    }
}

#Preview {
    Zip2(value: .constant(1.0))
}
