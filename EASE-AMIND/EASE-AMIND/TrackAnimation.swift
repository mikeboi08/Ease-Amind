//
//  TrackAnimation.swift
//  EASE-AMIND
//
//  Created by Jarvis Murray on 1/29/24.
//

import SwiftUI


struct TrackAnimation: View {
    @Binding var trackMove: Bool
    
    var totalDuration = 1.0
    var body: some View {
        ZStack{
            Toggle("", isOn: $trackMove)
            Image("Track Piece")
                .offset(x: trackMove ? 0: 0, y: trackMove ? -500: 0)
                .rotationEffect(Angle(degrees: trackMove ? 35: 0))
                .animation(.easeInOut(duration: 0.5), value: trackMove)
        }
    }
    
}

#Preview {
    TrackAnimation(trackMove: .constant(false))
}
