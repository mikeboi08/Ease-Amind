//
//  SplashScreen.swift
//  EASE-AMIND
//
//  Created by Dante Parker on 1/24/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        ZStack {
            Color.customYellow
                .ignoresSafeArea()
            
            VStack{
                Image("Favicon Logo")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.medium)
                    .padding()
                Text("EASE-AMIND")
                    .font(Font.custom("BodoniFLF", size: 65))
                    
            }
        }

        Spacer()
    }
}

#Preview {
    SplashScreen()
}
