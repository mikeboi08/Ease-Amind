//
//  SplashScreen.swift
//  EASE-AMIND
//
//  Created by Dante Parker on 1/24/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var isSheetShowing = false
    @State var isColorpickShowing = false
    
    @State var isActive = false
    var body: some View {
        ZStack {
            Color.customYellow
                .ignoresSafeArea()
            
            VStack{
                if self.isActive {
                    ZipperView()
                } else{
                    Image("Favicon Logo")
                        .resizable()
                        .scaledToFit()
                        .imageScale(.medium)
                        .padding(30)
//                    Spacer()
                    Text("E A S E - A M I N D")
                        .font(Font.custom("BodoniFLF", size: 35))
                        .foregroundStyle(Color.black)
                        .padding(32)
                        .scaledToFit()
                }
                //Spacer()
                
            }
                
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}



#Preview {
    SplashScreen()
}
