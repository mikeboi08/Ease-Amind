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
    @State var bgColor = Color.clear

    var body: some View {
        
            ZStack {
                Color(.customDarkBlue)
                    .ignoresSafeArea()
                
                VStack {
                    ColorPicker("Change the Background Color!", selection: $bgColor)
//                        .ColorPicker.textColor = view.backgroundColor?.isDarkColor == true ? .white : .black

                    Spacer()
                    SliderView()
                        .rotationEffect(Angle(degrees: 90))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(bgColor)
            }
            .ignoresSafeArea()
        }
    }


#Preview {
    ZipperView()
}
