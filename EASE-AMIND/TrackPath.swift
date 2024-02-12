//
//  TrackPath.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 2/7/24.
//

import SwiftUI

struct TrackPath: Shape {
    var position: CGPoint
    var filled: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        let numberOfSegments: CGFloat = 24
        
        let yPosition = position.y
        let yPositionOutOf12 = yPosition / (rect.height / numberOfSegments)
        
        for i in stride(from: CGFloat(numberOfSegments), to: 0, by: -1) {
            let yUp = rect.height * i / numberOfSegments
            
            var xUpOffset: CGFloat = 0
            var xOutOffset: CGFloat = 0
            var yUpOffset: CGFloat = 0
            if yUp < yPosition {
                xUpOffset = (yPositionOutOf12 - i) * (yPositionOutOf12 - i) * -4
                xOutOffset = (yPositionOutOf12 - i + 1) * (yPositionOutOf12 - i) * -4 - 10
                yUpOffset = (yPositionOutOf12 - i + 1) * 2
            }
            
            let xUp = rect.midX + xUpOffset + xOutOffset * 0.12
            let yUp1 = yUp - yUpOffset
            let up = CGPoint(x: xUp, y: yUp1)
            path.addLine(to: up)
            
            let xOut = rect.midX - 20 + xOutOffset
            let out = CGPoint(x: xOut, y: yUp)
            path.addLine(to: out)
            
            //            let yUp2 = rect.height * (i - 0.5) / numberOfSegments
            //            let xOut2 = xOut + xOutOffset * 0.25
            //            let up2 = CGPoint(x: xOut2, y: yUp2)
            //            path.addLine(to: up2)
            //            let xUp = (rect.midX - 50) + xUpOffset + xOutOffset * 0.12
            //            let yUp1 = yUp - yUpOffset
            //            let up = CGPoint(x: xUp, y: yUp1)
            //            path.addLine(to: up)
            //
            //            let xOut = (rect.minX + 80) + xOutOffset
            //            let out = CGPoint(x: xOut, y: yUp)
            //            path.addLine(to: out)
            //
            //            let yUp2 = rect.height * (i - 0.1) / numberOfSegments
            //            let xOut2 = xOut + xOutOffset * 0.25
            //            let up2 = CGPoint(x: xOut2, y: yUp2)
            //            path.addLine(to: up2)
            //
            //            let xIn = (rect.midX - 50) + xOutOffset
            //            let inward = CGPoint(x: xIn, y: yUp2)
            //            path.addLine(to: inward)
            //
            //            let yDown = (rect.maxY - 50) + yUpOffset
            //            let down = CGPoint(x: xIn, y: yDown)
            //            path.addLine(to: down)
            //
            //            let xIn2 = (rect.midX - 20) + xOutOffset
            //            let inward2 = CGPoint(x: xIn2, y: yDown)
            //            path.addLine(to: inward2)
            //
            //            let yUp3 = rect.height * (i - 0.1) / numberOfSegments
            //            let up3 = CGPoint(x: xIn2, y: yUp3)
            //            path.addLine(to: up3)
            //
            //            let xIn3 = (rect.midX) + xOutOffset
            //            let inward3 = CGPoint(x: xIn3, y: yUp3)
            //            path.addLine(to: inward3)
            //
            //            let down2 = CGPoint(x: xIn3, y: yDown)
            //            path.addLine(to: down2)
            
            
        }
        
        if filled {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
        
        return path
    }
}

#Preview {
    TrackPath(position: CGPoint(x: 100, y: 200), filled: false)
        .stroke(lineWidth: 5)
}
