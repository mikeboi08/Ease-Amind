//
//  ContentView.swift
//  EASE-AMIND
//
//  Created by Dante Parker on 1/24/24.
//

import SwiftUI

extension UIColor
{
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50
    }
}


struct ZipperView: View {
    @State var bgColor = Color.customDarkBlue
    @State var currentValue: Double = 0.0
    @State private var position = CGPoint(x: 0, y: 300)
    @State private var speed = CGFloat.zero
    @State private var yVelocity = CGFloat.zero
    @State var isSheetShowing = false
   //@Environment var backgroundColor =
    
    var body: some View {
        
        
        ZStack {
            Color(.customDarkBlue)
                .ignoresSafeArea()
            
            VStack {
                ColorPicker("Change the Background Color!", selection: $bgColor)
                    .padding(.horizontal)
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                //                  .ColorPicker.textColor = view.backgroundColor?.isDarkColor == true ? .white : .black
                ZStack{
                    TrackPath(position: CGPoint(x: 0, y: currentValue), filled: true)
                        .foregroundColor(.teal)
                    TrackPath(position: CGPoint(x: 0, y: currentValue), filled: true)
                        .foregroundColor(.teal)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    TrackPath(position: CGPoint(x: 0, y: currentValue), filled: false)
                        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .square, lineJoin: .bevel))
                    TrackPath(position: CGPoint(x: 0, y: currentValue), filled: false)
                        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .square, lineJoin: .bevel))
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    Zipper(value: $currentValue)
                }
                .ignoresSafeArea()
            }
            .background(bgColor)
        }
        
    }
}


#Preview {
    ZipperView()
}
