//
//  WelcomeScreen.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to")
            Text("Crypto trader")
                .font(.largeTitle)
            Spacer()
            Text("Simple and free crypto\ntrading simulator\nexperience")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "checkmark.square.fill")
                    Text("No signup required")
                }
                HStack {
                    Image(systemName: "checkmark.square.fill")
                    Text("Simple to use")
                }
                HStack {
                    Image(systemName: "checkmark.square.fill")
                    Text("Highly addictive")
                }
            }
            Spacer()
            HStack {
                Text("Data provided by")
                    .font(.caption)
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
