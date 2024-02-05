//
//  TrackAnimation.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 1/29/24.
//

import SwiftUI
import UIKit

struct TrackAnimation: View {
    @State var trackMove = true
    
    var body: some View {
        ZStack{
            Toggle("", isOn: $trackMove)
            VStack{
                ForEach(1..<20) { index in
                    Image("Track Piece")
                        .offset(x: CGFloat(trackMove ? 100 + index: 0), y: CGFloat(trackMove ? -100 + (index * 10): 0) )
                        .rotationEffect(Angle(degrees: trackMove ? 35: 0))
                        .animation(.easeInOut(duration: 0.5), value: trackMove)
                }
                ForEach(1..<20) { index in
                    Image("Track Piece")
                        .offset(x: CGFloat(trackMove ? -100 + index: 0), y: CGFloat(trackMove ? -100 + (index * 10): 0) )
                        .rotationEffect(Angle(degrees: trackMove ? -35: 0))
                        .animation(.easeInOut(duration: 0.5), value: trackMove)
                }
            }
        }
    }
}

#Preview {
    TrackAnimation()
}
