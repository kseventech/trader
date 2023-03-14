//
//  IntroductoryScreen.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct IntroductoryScreen: View {

    @StateObject var pickAssetVm = PickAssetViewModelImpl(service: CoinsServiceImpl())
    @State private var selectedTab: Int = 0

    var body: some View {
            VStack {
                TabView(selection: $selectedTab) {
                    WelcomeScreen()
                        .padding([.bottom], 80)
                        .padding([.top], 20)
                        .tag(0)

                    PickAssetScreen(vm: pickAssetVm)
                        .padding([.bottom], 80)
                        .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                Button("Continue", action: continueButtonPressed)
                    .buttonStyle(StandardButton())
                    .disabled(isContinueDisabled)
                Spacer()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
    }

    private var isContinueDisabled: Bool {
        selectedTab == 1 ? pickAssetVm.selectedCoin == nil : false
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
