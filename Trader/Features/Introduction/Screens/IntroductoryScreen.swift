//
//  IntroductoryScreen.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct IntroductoryScreen: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                WelcomeScreen()
                    .padding([.bottom], 80)
                    .padding([.top], 20)
                    .tag(0)
                
                AssetScreen()
                    .padding([.bottom], 80)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Button("Continue", action: continueButtonPressed)
                .buttonStyle(StandardButton())
            
            Spacer()
        }
        
    }
    
    private func continueButtonPressed() {
        withAnimation {
            selectedTab = (selectedTab + 1) % 2
        }
    }
}

struct IntroductoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroductoryScreen()
    }
}
