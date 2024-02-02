//
//  TrackAnimation.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 1/29/24.
//

import SwiftUI
import UIKit


struct TrackAnimation: View {
    @State var trackMove = false
    
    var body: some View {
        ZStack{
            Toggle("", isOn: $trackMove)
            Image("Track Piece")
                .offset(x: trackMove ? 0: 0, y: trackMove ? -500: 0)
                .rotationEffect(Angle(degrees: trackMove ? 35: 0))
                .animation(.easeInOut(duration: 0.5), value: trackMove)
            Image("Track Piece")
                .offset(x: trackMove ? 0: 0, y: trackMove ? -510: 10)
                .rotationEffect(Angle(degrees: trackMove ? -35: 0))
                .animation(.easeInOut(duration: 0.5), value: trackMove)
            
        }
    }
    
}
func trackPath(){
    let startingPoint = CGPoint(x: 0.0, y: 0.0)
    let bezierPath = UIBezierPath()
    bezierPath.move(to: startingPoint)
    //bezierPath.addCurve(to: <#T##CGPoint#>, controlPoint1: <#T##CGPoint#>, controlPoint2: <#T##CGPoint#>)
}

#Preview {
    TrackAnimation()
}
