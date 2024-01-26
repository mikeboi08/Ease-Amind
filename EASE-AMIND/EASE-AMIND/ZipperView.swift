//
//  ContentView.swift
//  EASE-AMIND
//
//  Created by Dante Parker on 1/24/24.
//

import SwiftUI

struct ZipperView: View {
    let feedbackGenerator = UISelectionFeedbackGenerator()

    var body: some View {
        ZStack{
            VStack{
                SliderView()
                    .rotationEffect(Angle(degrees: 90))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ZipperView()
}
